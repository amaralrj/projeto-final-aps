package br.com.puc.sispol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("mostraHome")
	public String mostraHome() {
		return "home/home";
	}
}
