package com.lec.yes25.financial;

import org.springframework.ui.Model;

public interface Command {
	public void execute(Model model);
}
