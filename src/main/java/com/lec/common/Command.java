package com.lec.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
