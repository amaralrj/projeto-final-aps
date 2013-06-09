package br.com.puc.sispol.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.dao.SimuladoDAO;
import br.com.puc.sispol.modelo.Simulado;

@Controller
public class SimuladoController {
	private SimuladoDAO dao;

	public SimuladoController() {
		this.dao = new SimuladoDAO();
	}

	@RequestMapping("novoSimulado")
	public String form() {
		return "simulado/formulario";
	}

	@RequestMapping("adicionaSimulado")
	public ModelAndView adiciona(@Valid Simulado simulado,
			BindingResult result) {

		ModelAndView mv = new ModelAndView("simulado/formulario");
		// mv.addObject("tarefas", tarefas);

		if (result.hasFieldErrors()) {
			return mv;
		}

		dao.adiciona(simulado);
		mv.addObject("sucesso", 1);
		return mv;
	}

}
