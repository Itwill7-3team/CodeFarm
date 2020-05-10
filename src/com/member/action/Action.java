package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
//	public abstract void method1();
//	abstract void method2();
//	public void method3();
//	void method4();
	
	// 추상메서드 선언 => 인터페이스를 구현하는 모든 클래스에 처리하는 동작의 틀을 구성한다.
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	

}
