
package com.vanda.service;

import java.util.List;

import com.vanda.domain.HospitalVO;
import com.vanda.domain.KakaoVO;
import com.vanda.domain.UserVO;

public interface UserService {
	// 회원가입 서비스
	public int geInsert(UserVO userVO);

	// 수의사 회원가입
	public int docInsert(UserVO userVO);

	// 소셜 회원가입
	public int soInsert(KakaoVO kakaoVO);

	// 로그인
	public UserVO login(String user_id, String user_pass);

	// 안드로이드 자동 로그인
	public UserVO autoLogin(String user_id);

	// 카카오 로그인
	public UserVO kakaoLogin(String user_id);

	// 마이페이지(비밀번호 변경)
	public void myPage(UserVO userVO);

	// 마이페이지 (회원정보 변경)
	public void editINFO(UserVO userVO);

	// 회원탈퇴
	public void bye(UserVO userVO);

	// 중복체크
	public int idChk(UserVO userVO);

	// 토큰 업데이트
	public void tokenUpdate(String user_id, String token);

	// 토큰 들고오기
	public UserVO tokenGet(String device_id);

	public void registerDev(String device_id, int device_type);

	public List<Integer> selectPetnum(String user_id);

	public void registerMemdev(String user_id, String device_id, Integer integer);

	public List<Integer> oldPetnum(String user_id);

	public int hospChk(String user_id);

	public HospitalVO selHosp(String user_id);

	public void hospInsert(HospitalVO hosp);

	public void setDoc(String user_id, String hosp_tel);

	public void hospModify(HospitalVO hosp);

}
