package com.vanda.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.vanda.domain.WalkVO;
import com.vanda.domain.WalksVO;
import com.vanda.service.PetService;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	private PetService petService;

	private static final Logger log = LoggerFactory.getLogger(MapController.class);

	// 폴더 생성
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);

	}

	@RequestMapping("/view")
	public void view() {
		System.out.println("");
	}

	@PostMapping("/walk")
	@ResponseBody
	public void walk(@RequestBody String walkList, Model model) {
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		Date nowDate = new Date();
		String today = df.format(nowDate);
		String fileName = "";
		String path = "";

		System.out.println("왔나?" + walkList);
		List<WalkVO> voList = new ArrayList<>();
		WalksVO walks = new WalksVO();

		JSONArray jsonArr = new JSONArray(walkList);
		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonObj = jsonArr.getJSONObject(i);
			Gson gson = new Gson();
			WalkVO vo = gson.fromJson(jsonObj.toString(), WalkVO.class);

			voList.add(vo);
			System.out.println("왔나?" + voList.get(i).toString());
		}

		int pet_num = voList.get(0).getPetNum();
		double total_distance = voList.get(voList.size()-1).getTotal();
		String timer = voList.get(voList.size()-1).getTimer();
		walks.setWalks(voList);

		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(WalksVO.class);
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

			// Marshal the employees list in console
			jaxbMarshaller.marshal(walks, System.out);

			String uploadFolder = "c:\\xml";
			String uplaodFolderPath = getFolder();
			fileName = pet_num + today;
			

			File uploadPath = new File(uploadFolder, uplaodFolderPath);
			path = uploadPath.toString();

			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}

			// Marshal the employees list in file
			jaxbMarshaller.marshal(walks, new File(uploadPath.toString() + "/" + pet_num + today + ".xml"));


			System.out.println("- 펫 번호: " + pet_num);
			System.out.println("- 토탈: " + total_distance);
			System.out.println("- 경로: " + path);
			System.out.println("- 파일 생성이름: " + pet_num + today);
			
			
		} catch (Exception e) {

		}
		System.out.println("+"+path);
		System.out.println("+"+fileName);
		
		petService.actRegister(pet_num, path, fileName,total_distance,timer);
		
	}

	@GetMapping("/walk")
	public void walk() {

		System.out.println("왔나?");

	}

}