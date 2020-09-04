package com.vanda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.HospitalVO;
import com.vanda.domain.RoomVO;
import com.vanda.domain.UserVO;
import com.vanda.service.ChatService;
import com.vanda.service.PetService;

@Controller
@RequestMapping("/consulting/*")
public class ConsultingController {

	@Autowired
	PetService petService;

	@Autowired
	private ChatService service;

	@RequestMapping("/loginForm")
	public void loginForm() {

	}

	@GetMapping("/room")
	public void room() {

	}

	@GetMapping("/roomList")
	public void roomList(HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("check");

		List<RoomVO> room = service.roomList(loginUser.getUser_id());
		session.setAttribute("roomList", room);
	}

	@RequestMapping("/roomRegist")
	public String roomRegist(RoomVO room, RedirectAttributes rttr) {
		service.insert(room);
		rttr.addFlashAttribute("room", room);
		return "consulting/chat";
	}

	// 뷰 보여주는부분
	@GetMapping("/consulting")
	public void consulting() {
	

	} // 뷰 보여주는부분

	@GetMapping("/chat")
	public void chat(HttpSession session, String user_id) {

		UserVO loginUser = (UserVO) session.getAttribute("check");
		List<RoomVO> room = service.roomList(loginUser.getUser_id());
		List<RoomVO> roomDoc = service.roomDocList(loginUser.getUser_id());
		System.out.println(room.toString());
		System.out.println(roomDoc.toString());
		session.setAttribute("roomList", room);
		session.setAttribute("roomDocList", roomDoc);
//		model.addAttribute("roomList", room);
//		model.addAttribute("roomDocList", roomDoc);
	}

	@ResponseBody
	@PostMapping("/selectHospital")
	public HospitalVO selectHospital(String hosp_name) {
		System.out.println(hosp_name);
		HospitalVO hpVO = petService.selectHospital(hosp_name);

		if (hpVO == null) {
			System.out.println("해당병원없음");

			return null;
		} else {
			return hpVO;

		}
	}


}
