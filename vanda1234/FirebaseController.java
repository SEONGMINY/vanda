package com.vanda.controller;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vanda.domain.UserVO;
import com.vanda.service.UserService;

@Controller
@RequestMapping("/firebase")
public class FirebaseController {
	
	@Autowired
	private UserService userService;
	
	// 센서값 리스트(받아온 값이 string형일때)
	private ArrayList<Float> list = new ArrayList<Float>();
	
	@ResponseBody
	@RequestMapping(value = "/push", method = RequestMethod.POST)
	// 구글 인증 서버, 매개변수의경우 라즈베리파이에서 보내는 데이터를 vo로 받아서 처리하면됨
	public String pushFCMNotification(HttpServletRequest httpServletRequest) throws Exception {
		// firebase console에서 발급받은 api_key 입력
		String API_KEY = "AAAA55gMmvw:APA91bGBNIfSfAU6kso8vYwzzFLDR1z0lJg6_5ClfcUFjEPaF1HCz2My6NtnCn0moqN0fRmesDwgrOrzB4tTx91AitDDOZ5cAnx7vKxCrqoZTAkWyu155wIrF9ubJCQB7wphg_FjXS3r";
		String token = "";
		
		JSONObject infoJson = new JSONObject();
		JSONObject json = new JSONObject();

		// 받아온 센서값이 string형
		String test = httpServletRequest.getParameter("result");
		// JSON 변환
		JSONObject test1 = new JSONObject(test);
		String device_id = (String) test1.get("device_id");
		UserVO userVO = userService.tokenGet(device_id);
		token = userVO.getToken();
		System.out.println("token:"+token);
		float data = test1.getFloat("data");
		
		list.add(data);
		
		System.out.println("----------------------------------------------");
		System.out.println("----------디바이스 아이디 값 : " + device_id + "데이터 값 : " + data);
		System.out.println("현재 배열 : " + list.toString());
		System.out.println("----------------------------------------------");
		
		if (list.size() == 10) {
			Collections.sort(list);
			float pet_weight = list.get(list.size() - 1);
			System.out.println("가장 큰값 : " + pet_weight);
			
			// 실제 보내는 부분
			URL url = new URL("https://fcm.googleapis.com/fcm/send");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "key=" + API_KEY);
			conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			// 일반 텍스트 전달시 Content-Type , application/x-www-form-urlencoded;charset=UTF-8

			// 알림 + 데이터 메세지 형태의 전달
			
			infoJson.put("title", "아두이노 데이터"); // 제목
			infoJson.put("body", pet_weight); // 메세지
			json.put("to", token.trim()); // trim() 생략가능 만약 오류발생시 공백제거용으로 사용
			json.put("notification", infoJson);

			// 서버에서 날려서 한글 깨지는 사람은 아래처럼 UTF-8로 인코딩해서 날려주자
			OutputStreamWriter owr = new OutputStreamWriter(conn.getOutputStream(), "utf-8");
			owr.write(json.toString());
			owr.flush();
			owr.close();

			if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
				System.out.println("Output from Server : " + conn.getResponseCode());
			} else {
				// 400, 401, 500 등
				System.out.println("Failed : HTTP error code : " + conn.getResponseCode());
			}
			conn.disconnect();
			
			list.clear();

			return json.toString();
		}
		
		return "";
		
		
		
	}

}
