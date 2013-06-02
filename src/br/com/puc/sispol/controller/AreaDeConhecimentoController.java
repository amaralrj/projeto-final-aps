package br.com.puc.sispol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.dao.TarefaDAO;

@Controller
public class AreaDeConhecimentoController {
	private AreaDeConhecimentoDAO dao;

	public AreaDeConhecimentoController() {
		this.dao = new AreaDeConhecimentoDAO();
	}

	@RequestMapping("novaAreaDeConhecimento")
	public String form() {
		return "area_de_conhecimento/formulario";
	}

}
