package jspBulletinBoard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ComHandlerInterface;

public class NullComHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		return null;
	}

}
