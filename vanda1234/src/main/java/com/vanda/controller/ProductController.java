package com.vanda.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vanda.domain.OrderListVO;
import com.vanda.domain.OrderVO;
import com.vanda.domain.ProductVO;
import com.vanda.service.OrderService;
import com.vanda.service.ProductService;
import com.vanda.service.shopmypageService;
import com.vanda.utils.Common;
import com.vanda.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/product", method = RequestMethod.GET)
public class ProductController {

	@Autowired
	private OrderService orderservice;

	@Autowired
	private ProductService productservice;
	
	@Autowired
	private shopmypageService shopservice;
	// servlet-context.xml 에 설정된 기본 UploadPath
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 홈
	@RequestMapping(value = "/shopmain", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		model.addAttribute("productlist", productservice.get_productList());

		return "product/shopmain";
	}

	// 상품등록 페이지이동
	@RequestMapping(value = "/product_register", method = RequestMethod.GET)
	public String product(ProductVO vo, Model model) {

		// vo에 전달받은 값이 있을경우 수정할수있게 이동
		if (vo.getPro_num() > 0) { // if문에 0보다 클경우는 pro_num이 있을경우에만 해당 왜냐하면 시퀀스값으로 자동으로 인서트가 되기때문에 0보다 작을수가없음

			// 객체로 리턴하는이유는 여러개의 상품을 수정할경우는 ArrayList or List로 리턴을 하지만 단일상품을 수정하기때문에 단일객체로
			// 해당값을 받아와 model객체에 저장
			ProductVO productList = productservice.get_Product(vo.getPro_num());
			model.addAttribute("product", productList);

		}

		// vo에 전달받은 값이 없을경우 상품등록페이지로 이동ord

		return "product/Product_Register";
	}

	// 상품등록
	@RequestMapping(value = "/product_insert", method = RequestMethod.POST)
	public String insertProduct(ProductVO vo, MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "upload"; // 파일이 업로드될 경로설정
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 날짜별 폴더분류
		String fileName = null; // 초기화

		// 파일이 인서트 되지않을 경우
		if (file != null) {
			// 실제 파일을 생성하는 부분 실질적인 처리는 UploadFileUtils클래스 안에있는 fileUpload 메서드가 처리
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		// vo를 다시 셋팅하는 이유는 파일의 경우 실제 해독하는 과정이 필요하기때문에 UploadUtils안에있는 uuid 밑 경로를 재설정해
		// 데이터베이스에 삽입하기위해 다시 imgae관련
		// vo를 재설정
		vo.setImg_path(File.separator + "upload" + ymdPath + File.separator + fileName);
		vo.setImg_name(fileName);

		productservice.proInsert(vo);

		productservice.pro_imgInsert(vo);

		return "redirect:/product/shopmain";

	}

	// 상품리스트
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public String productList(Model model) {

		System.out.println(productservice.get_productList());

		model.addAttribute("productlist", productservice.get_productList());

		return "product/ProductView";
	}

	// 상품리스트
	@RequestMapping(value = "/productmain")
	public String productmain() {

		return "product/productmain";
	}

	// 상품삭제
	@ResponseBody // Ajax를 사용해 데이터를 리턴할경우 ResponseBody등록후 사용
	@RequestMapping(value = "/productDelete", method = RequestMethod.POST) // URL 값
	public String productDelete(ProductVO vo) throws Exception { // 메서드가 들어가는부분

		// 상품을 삭제하기위해 상품의 경로를 가져옴
		String img_name = productservice.get_ImageName(vo.getPro_num());

		// 실제 상품에 등록된 이미지를 처리하는 메서드
		UploadFileUtils.deleteFile(img_name, uploadPath);

		int result;
		String resultStr = "";
		result = productservice.ImageDel(vo);
		// insert delete update의 경우 0을 리턴하는순간 변화하는 행이없기때문에 오류로 판단 그렇기떄문에 0보다 작을경우는 오류를
		// 발생시키기때문에 resultStr객체에
		// fail을 저장 그후 ajax의 success부분에서 해당 문자열을 판단후 동작에 대한 리턴값을 정리
		if (result > 0) {
			productservice.ProductDel(vo);
			resultStr = "success";
		} else {
			System.out.println("오류");
			resultStr = "fail";
		}

		return resultStr;
	}

	// 상품수정 키값리턴
	@ResponseBody
	@RequestMapping(value = "/productModify", method = RequestMethod.POST)
	public String productModify(ProductVO vo) {

		String pro_num = String.valueOf(vo.getPro_num());

		return pro_num;
	}

	// 상품수정
	@RequestMapping(value = "/product_modifyProc", method = RequestMethod.POST)
	public String product_modifyProc(ProductVO vo, MultipartFile file) throws Exception {

		String fileName = null;
		if (file.isEmpty()) {
			// 파일없을때
			productservice.ProductModify(vo);
		} else {
			// 파일있을떄
			UploadFileUtils.deleteFile(vo.getImg_path(), uploadPath); // 기존 파일삭제
			String imgUploadPath = uploadPath + File.separator + "upload"; // 새롭게 업로드된 파일의 경로설정
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 폴더분류

			// 파일 다시 생성
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setImg_path(File.separator + "upload" + ymdPath + File.separator + fileName);
			vo.setImg_name(fileName);
			System.out.println(vo.getImg_path());
			int i = productservice.ImageModify(vo);
			int j = productservice.ProductModify(vo);

			// 수정이안되었다면 수정실패 원래는 수정실패에 대한 return값을 정의하지만 console에서 확인하는 용도로 작성
			if (i > 0 && j > 0) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");
			}
		}

		return "redirect:/";
	}

	// 상품 주문(상품 상세화면)
	@RequestMapping("/ProductRead")
	public String productorder(ProductVO productVO, Model model, MultipartFile file) throws Exception {

		System.out.println("출력");

		model.addAttribute("read", productservice.read(productVO.getPro_num()));
		System.out.println(productVO.getPro_num());

		return "product/ProductRead";
	}

	// 상품 주문
	@RequestMapping(value = "/ProductOrder")
	public String productorder1(int pro_num, int count, Model model) throws Exception {

		System.out.println("--------------------");
		System.out.println("구매자 상세정보 출력화면");
		System.out.println(pro_num + "/" + count);
		System.out.println("--------------------");

		ProductVO productVO = productservice.read(pro_num);
		productVO.setCount(count);
		model.addAttribute("read", productVO);

		return "product/ProductOrder";
	}

	// 상품 주문(구매자 정보입력란)
	@ResponseBody
	@RequestMapping(value = "/order_info", method = RequestMethod.POST)
	public void productorder(OrderVO orderVO, ProductVO proVO) {

		System.out.println("--------------------");
		System.out.println("주문");
		System.out.println(proVO.getPro_num());
		System.out.println(proVO.getCount());
		System.out.println(orderVO.getOrd_msg() + "/" + orderVO.getPay_price() + "/" + orderVO.getRecip_name() + "/"
				+ orderVO.getRecip_tel());
		System.out.println(orderVO.getRecip_add() + "/" + orderVO.getRecip_add2() + "/" + orderVO.getRecip_add3());
		System.out.println("--------------------");
		orderservice.orderinfo(orderVO);
		System.out.println("+" + orderVO.getOrd_num());
		orderservice.orderlist(orderVO.getOrd_num(), proVO.getPro_num(), proVO.getCount());
		
		
		// 1번 결제 끝
		
		orderservice.amount_discount(proVO);
		// 2번

	}

	/*
	 * // 상품 주문 후 상품 수량 수정
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/productModify", method = RequestMethod.POST) public
	 * String AmountModify(ProductVO productvo) {
	 * 
	 * String pro_num = String.valueOf(vo.getPro_num());
	 * 
	 * return pro_num; }
	 */

	// 상품 장바구니
	@ResponseBody
	@RequestMapping(value = "product/ProductBasket", method = RequestMethod.POST)
	public String productbasket(ProductVO productVO, HttpServletRequest request) {
		System.out.println("------------------");
		System.out.println("장바구니버튼클릭");
		System.out.println("------------------");
		// 새로운 VO생성
		ProductVO vo = new ProductVO();

		// 데이터 값(pro_num) 가져오기
		vo = productservice.get_Product(productVO.getPro_num());
		vo.setCount(productVO.getCount());

		int current_size = Common.basketList.size();

		// 장바구니에 데이터 담기(vo담기)
		Common.basketList.add(vo);

		System.out.println(Common.basketList.get(Common.basketList.size() - 1).toJson());

		String resultString;

//		model.addAttribute("basketList", Common.basketList);
		request.getSession().setAttribute("basketList", Common.basketList);

		if (current_size < Common.basketList.size()) {
			resultString = "success";
		} else {
			resultString = "fail";
		}

		return resultString;
	}

	// 상품 장바구니페이지보여주기

	@RequestMapping(value = "/ProductBasket", method = RequestMethod.POST)
	public String productbasket1(ProductVO productVO, HttpServletRequest request) {

		System.out.println("장바구니리스트 페이지 이동");

		/* request.getSession().setAttribute("basketList", Common.basketList); */
		return "product/ProductBasket";
	}

	// 상품 장바구니페이지 상품삭제

	@RequestMapping(value = "/basketdelete", method = RequestMethod.POST)
	@ResponseBody
	public String productbasketdelete(ProductVO productVO, HttpServletRequest request) {

		System.out.println("장바구니리스트 상품삭제");
		System.out.println("------------------");
		System.out.println(productVO.getPro_num());

		for (int i = 0; i < Common.basketList.size(); i++) {
			if (Common.basketList.get(i).getPro_num() == productVO.getPro_num()) {
				Common.basketList.remove(i);
				break;
			}
		}

		request.getSession().setAttribute("basketList", Common.basketList);

		return "success";
	}

	// 장바구니 결제
	@RequestMapping(value = "product/ProductBaskettest", method = RequestMethod.GET)
	public String basketorder(ProductVO productVO, HttpServletRequest request) {

		System.out.println("장바구니결제부분");
		// 새로운 VO생성

		// 데이터 값(pro_num) 가져오기

		int current_size = Common.basketList.size();

		// 장바구니에 데이터 담기(vo담기)

		System.out.println(Common.basketList.get(Common.basketList.size() - 1).toJson());

		String resultString;

//			model.addAttribute("basketList", Common.basketList);
		request.getSession().setAttribute("basketList", Common.basketList);

		if (current_size < Common.basketList.size()) {
			resultString = "success";
		} else {
			resultString = "fail";
		}

		return resultString;
	}
	
	// 상품 주문
	@RequestMapping(value = "/basketInfo")
	public String basketInfo(int totalPrice, Model model) throws Exception {

		System.out.println("--------------------");
		System.out.println("장바구니 구매 페이지");
		System.out.println(totalPrice);
		System.out.println("--------------------");
		
		model.addAttribute("total", totalPrice);

		return "product/BasketOrder";
	}
	
	// 상품 주문(구매자 정보입력란)
		@ResponseBody
		@RequestMapping(value = "/basketOrder", method = RequestMethod.POST)
		public void basketOrder(OrderVO orderVO,HttpServletRequest request) {
			ArrayList<ProductVO> basket = Common.basketList;
			System.out.println("--------------------");
			System.out.println("주문");
			System.out.println(orderVO.getOrd_msg() + "/" + orderVO.getPay_price() + "/" + orderVO.getRecip_name() + "/"
					+ orderVO.getRecip_tel());
			System.out.println(orderVO.getRecip_add() + "/" + orderVO.getRecip_add2() + "/" + orderVO.getRecip_add3());
			System.out.println("--------------------");
			orderservice.orderinfo(orderVO);
			System.out.println("+" + orderVO.getOrd_num());
			
			for(int i=0;i<basket.size();i++) {
				orderservice.orderlist(orderVO.getOrd_num(), basket.get(i).getPro_num(), basket.get(i).getCount());
			}
			
			ProductVO productvo;
			for(int i=0;i<basket.size();i++) {
				productvo = new ProductVO();
				productvo.setPro_num(basket.get(i).getPro_num());
				productvo.setCount(basket.get(i).getCount());
				orderservice.amount_discount(productvo);
			}
			
			Common.basketList.removeAll(basket);
			
			request.getSession().setAttribute("basketList", Common.basketList);

			// 1번 결제 끝
			
			// 2번

		}
		// 인기상품 보여주기
		@RequestMapping(value = "/Bestproduct", method = RequestMethod.GET)
		public String bestproduct(Model model,ProductVO productVO) {

			
			System.out.println("----------------------------");
			System.out.println("--------인기상품페이지이동-------");
			System.out.println("----------------------------");
			System.out.println(productservice.get_productList());

			model.addAttribute("productlist", orderservice.bestProduct(productVO));

			return "product/Bestproduct";
		}
		
		//마이페이지
		
		@RequestMapping(value = "/shopmypage", method = RequestMethod.GET)
		public String shopmypage(Model model,OrderListVO orderlistVO) {

			
			System.out.println("----------------------------");
			System.out.println("--------마이페이지이동----------");
			System.out.println("----------------------------");
			
			
			String user_id = "TEST1";
			
			ArrayList<OrderListVO> list = shopservice.mypage(user_id);
			
			model.addAttribute("productlist", shopservice.mypage(user_id));
		
			for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i).getOrd_num());
			}

			return "product/shopmypage";
		}
		

}
