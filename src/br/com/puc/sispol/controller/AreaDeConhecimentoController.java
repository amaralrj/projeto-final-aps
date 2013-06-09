package br.com.puc.sispol.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.modelo.AreaDeConhecimento;

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

	@RequestMapping("adicionaAreaDeConhecimento")
	public ModelAndView adiciona(@Valid AreaDeConhecimento areaDeConhecimento,
			BindingResult result) {

		ModelAndView mv = new ModelAndView("area_de_conhecimento/formulario");
		// mv.addObject("tarefas", tarefas);

		if (result.hasFieldErrors()) {
			return mv;
		}

		dao.adiciona(areaDeConhecimento);
		mv.addObject("sucesso", 1);
		return mv;
	}

}
