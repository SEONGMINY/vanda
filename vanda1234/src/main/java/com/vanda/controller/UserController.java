
package com.vanda.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.vanda.domain.EatVO;
import com.vanda.domain.KakaoVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.UserVO;
import com.vanda.domain.WeightVO;
import com.vanda.service.PetService;
import com.vanda.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
 
   @Autowired
   private UserService userService;
   @Autowired
   private PetService petService;
   
   //선택한 펫의 목록보여줌
   @ResponseBody
   @RequestMapping(value="/test",method = RequestMethod.POST)
   public PetVO changePetList(int pet_num,HttpSession session) {
      
      //선택한 펫의 정보를 pet_num을 가지고 찾아서 petVO에 넣는다.
      PetVO petVO = petService.changePetList(pet_num);
      
      //배식 리스트
      EatVO eatVO = petService.eatList(pet_num);
      //체중 리스트
      WeightVO weightVO = petService.weightList(pet_num);
      
      //세션에 추가해서 뷰에서 보여주도록 함.
      session.setAttribute("pet2", petVO);
      session.setAttribute("eat",eatVO);
      session.setAttribute("weight",weightVO);

      return petVO;
      
   }

   //회원가입 선택 화면
   @RequestMapping("selectSignUp")
   public String signUp() {
      System.out.println("회원가입 선택");

      return "user/selectSignUp";
   }

   //일반회원가입 화면연결
   @RequestMapping("geSignUp")
   public String geSignUp() {
      System.out.println("일반회원 가입");

      return "user/geSignUp";
   }

   //일반 회원가입 처리
   @RequestMapping(value = "geSignUp", method = RequestMethod.POST)
   public String gesignUp(UserVO userVO) throws Exception {

      System.out.println("가입 성공");
      int result = userService.idChk(userVO);

      if (result == 1) {
         System.out.println("중복된 아이디");

         return "redirect:/user/geSignup";
      } else if (result == 0) {
         System.out.println("사용가능한 아이디");
         userService.geInsert(userVO);

   }
      return "redirect:/";

   }

   //수의사 회원가입 화면연결
   @RequestMapping("docSignUp")
   public String docSignUp() {
      System.out.println("수의사 회원가입");

      return "user/docSignUp";
      
   }

   //수의사 회원가입 처리
   @RequestMapping(value = "docSignUp", method = RequestMethod.POST)
   public String docsignUp(UserVO userVO) throws Exception {

      System.out.println("가입 성공");
      int result = userService.idChk(userVO);
      
      if (result == 1) {
         System.out.println("중복된 아이디");
         
         return "redirect:/user/docSignUp";
      } else if (result == 0) {
         
         System.out.println("사용가능한 아이디");
         userService.docInsert(userVO);
         
      }
      
      return "redirect:/";
      
   }


   //소셜 회원가입 처리
   @RequestMapping(value = "soSignUp", method = RequestMethod.POST)
   public String sosignUp(KakaoVO kakaoVO) throws Exception {

      System.out.println("가입 성공");
      int result = 0;

      if (result == 1) {
         System.out.println("중복된 아이디");

         return "redirect:/user/soSignUp";

      }
      
      else if (result == 0) 
      
      {
         
         System.out.println("사용가능한 아이디");
         userService.soInsert(kakaoVO);
         
      }
      
      return "redirect:/";

   }


   //로그인 화면 연결
    @RequestMapping(value="/login", method=RequestMethod.GET) 
    public String login() { 
       System.out.println("로그인");
       
     return "user/login";
     
    }


      //일반 로그인 처리
   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public String login(String user_id, String user_pass, HttpSession session,Model model) throws Exception {

      UserVO loginUser = userService.login(user_id, user_pass);

      if (loginUser != null) {

         session.setAttribute("check", loginUser);
         System.out.println("loginUserID = " + loginUser.getUser_id());
         
         //펫정보 받아오는부분. ---> 펫컨트롤러로 이동.

         
         //로그인한 유저의 펫정보를 받아옴.
         List<PetVO> petUser = petService.getPetInfo(user_id);
       
   
         session.setAttribute("pet",petUser);
         System.out.println("pet정보:"+ petUser); 
         //가장 오래키운펫의 펫넘
         List<Integer> oldPetnum =  new ArrayList<Integer>();
         oldPetnum = userService.oldPetnum(user_id);
         
         session.setAttribute("nonSelectedPet", petService.nonSelectedPet(oldPetnum.get(0)));
         
         System.out.println("pet정보 : " + petUser);
         return "home";
      }
      else {
         session.setAttribute("check", null);
         System.out.println("id/password 오류!!");
         return "user/login";

      }
   }


   // 카카오 로그인 05.28db에 아이디 비교후 있을때는 로그인해주고. 없을시에는 회원가입페이지로 연결해줌.
      @RequestMapping(value = "kakaoLogin", produces = "application/json", method = { RequestMethod.GET/*,RequestMethod.POST*/ })
      public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
            HttpServletResponse response, HttpSession session,Model model) throws Exception {
         ModelAndView mav = new ModelAndView();
         
         
         UserVO loginUser = null;      
         
         
   // 결과값을 node에 담아줌
         JsonNode node = KakaoAPIController.getAccessToken(code);
         // accessToken에 사용자의 로그인한 모든 정보가 들어있음
         JsonNode accessToken = node.get("access_token");
   // 사용자의 정보 
         JsonNode userInfo = KakaoAPIController.getKakaoUserInfo(accessToken);
         String kemail = null;
         String kname = null;
      
   // 유저정보 카카오에서 가져오기  Get properties 
         JsonNode properties = userInfo.path("properties");
         JsonNode kakao_account = userInfo.path("kakao_account");
         kemail = kakao_account.path("email").asText();
         kname = properties.path("nickname").asText();
         session.setAttribute("kemail", kemail);
         session.setAttribute("kname", kname);
         
         //웹에서 카카오 정보로 로그인 시도.
         loginUser=userService.kakaoLogin(kemail);
         //userService.soInsert(loginUser);

         session.setAttribute("token", accessToken);
         System.out.println("loginUser = " + loginUser);
         
         
         //db랑 비교해서 로그인한유저가 db에 존재할때.
         if (loginUser != null) {

            session.setAttribute("check", loginUser);
            System.out.println("loginUserID = " + loginUser.getUser_id());
            /*펫정보 받아오는부분. ---> 펫컨트롤러로 이동.
             * PetVO petUser = petService.getPetInfo(kemail);
            //model.addAttribute("pet",petUser);
         //session.setAttribute("pet", petUser);
         System.out.println("pet정보 : " + petUser);*/
                  
            
            //뷰에 세션값들을 뿌려줌.
            mav.setViewName("pet/main"); 
      
         } else {
            //loginUser가 null일때
            session.setAttribute("check", null);

            System.out.println("db에 존재하지않는 회원입니다.");
            mav.setViewName("user/soSignUp");
         }
         
      //   mav.setViewName("user/loginResult"); 
         System.out.println("로그인한 유저 아이디 : kemail : " + kemail);
         System.out.println("카카오 정보 : " + kakao_account);
   
      
         return mav;
      }// end kakaoLogin()


   //로그아웃
   @RequestMapping("logout")
   public String logout(HttpSession session) throws Exception {
      
      KakaoAPIController kr = new KakaoAPIController();
      kr.kakaoLogout((String)session.getAttribute("access_Token"));
       session.removeAttribute("token");
       session.removeAttribute("kemail");
      session.invalidate();
      
      return "redirect:/";
      
   }
      
   // 마이페이지 이동
   @RequestMapping("myPage")
   public String myPage() {
      return "user/myPage";
   }

   // 회원정보 수정
   @RequestMapping(value = "/editINFO", method = RequestMethod.POST)
   public String editINFO(UserVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {
      UserVO loginUser = (UserVO) session.getAttribute("check");
      /*
        System.out.println("현재 로그인 유저 : " + loginUser);
       System.out.println("myPage에서 입력된 아이디 정보 : " + userVO);
       */

      // user_id를 세션에 저장되어있는 아이디,이름으로 선언
      String user_id = loginUser.getUser_id();
      String user_sex = loginUser.getUser_sex();
      String user_pass = loginUser.getUser_pass();
      String user_name = loginUser.getUser_name();

      // myPage에서 입력된 아이디정보를 세션에 저장되어있는 아이디로 다시 넣어줌. -> myPage에서는 입력을 해주지않기때문에 그렇지않으면
      // null됨.
      userVO.setUser_id(user_id);
      userVO.setUser_sex(user_sex);
      userVO.setUser_pass(user_pass);
      userVO.setUser_name(user_name);
      // 위의 두가지는 변하지 않는 정보.

      // 폰번호,또는 주소에서 입력값이 없을때 현재 로그인된 정보를 다시 넣어줌. -> 하나만 변경할수 있기때문에 이 조건문이 없다면 null발생.
      if (userVO.getUser_tel() == null) {
         userVO.setUser_tel(loginUser.getUser_tel());
      }

      // userVO에 담긴 정보들을 보내줌.
/*      int check = userService.editINFO(userVO);

      if (check == 1) {
         session.setAttribute("check", userVO);
         System.out.println(check);
      }
*/
      userService.editINFO(userVO);
      session.setAttribute("check", userVO);
      rttr.addFlashAttribute("msg", "회원정보 수정 완료");
      return "redirect:/user/myPage";
      
   }
   
   // 비밀번호 변경
   @RequestMapping(value = "/myPage", method = RequestMethod.POST)
   public String myPage(String user_pass, HttpSession session, RedirectAttributes rttr) throws Exception {
      String user_id = ((UserVO) session.getAttribute("check")).getUser_id();
      UserVO userVO = new UserVO();
      userVO.setUser_id(user_id);
      userVO.setUser_pass(user_pass);
      
      userService.myPage(userVO);
      session.invalidate();
      rttr.addFlashAttribute("msg", "비밀번호 변경 완료!");
      return "redirect:/user/myPage";
      /* return "user/confirm"; */
   
   }
   
   // 회원탈퇴
   @RequestMapping(value = "/bye")
   public String bye(HttpSession session, RedirectAttributes rttr) {
      UserVO userVO = (UserVO) session.getAttribute("check");
      userService.bye(userVO);

      rttr.addFlashAttribute("msg", "회원탈퇴 완료!!");
      session.invalidate();
      
      return "redirect:/";
      
   }

   // 아이디 중복체크
   @ResponseBody
   @RequestMapping(value = "/idChk", method = RequestMethod.POST)
   public int idChk(UserVO userVO) {
      int result = userService.idChk(userVO);
      return result;

   }
   
   // 기기등록
   @RequestMapping(value = "/registerDev", method = RequestMethod.POST)
   public String registerDev(String device_id, int device_type,HttpSession session) throws Exception {
   
	   UserVO loginUser = (UserVO) session.getAttribute("check");
	   String user_id = loginUser.getUser_id();
	   List<Integer> petnum =  new ArrayList<Integer>();
	   petnum = userService.selectPetnum(user_id);
	 
	   userService.registerDev(device_id,device_type);
	   
	   
	   for(int i=0; i<petnum.size(); i++) {
		
			userService.registerMemdev(user_id,device_id,petnum.get(i));
	   }
	   
	   
	   return "home";
   
   }

}