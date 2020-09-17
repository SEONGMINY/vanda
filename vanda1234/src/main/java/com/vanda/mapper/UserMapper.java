
package com.vanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vanda.domain.DoctorVO;
import com.vanda.domain.KakaoVO;
import com.vanda.domain.UserVO;

public interface UserMapper {

	public int geInsert(UserVO userVO);

	public int docInsert(UserVO userVO);

	// 일반 로그인
	public UserVO login(@Param("user_id") String user_id, @Param("user_pass") String user_pass);

	// 안드로이드 자동 로그인
	public UserVO autoLogin(@Param("user_id") String user_id);

	// 카카오 로그인
	public UserVO kakaoLogin(@Param("user_id") String user_id);

	// 마이페이지(비밀번호 변경)
	public void myPage(UserVO userVO);

	// 마이페이지 (회원정보 변경)
	public void editINFO(UserVO userVO);

	// 회원탈퇴
	public void bye(UserVO userVO);

	// 중복체크
	public int idChk(UserVO userVO);

	public int soInsert(KakaoVO kakaoVO);

	// 토큰 업데이트
	public void tokenUpdate(@Param("user_id") String user_id, @Param("token") String token);

	// 토큰 들고오기
	public UserVO tokenGet(@Param("device_id") String device_id);

	public void registerDev(@Param("device_id")String device_id,@Param("device_type") int device_type);

	public List<Integer> selectPetnum(String user_id);

	public void registerMemdev(@Param("user_id")String user_id,@Param("device_id") String device_id, @Param("is")Integer integer);

	public List<Integer> oldPetnum(String user_id);
	


}