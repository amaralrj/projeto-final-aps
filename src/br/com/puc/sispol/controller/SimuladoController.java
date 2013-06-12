package br.com.puc.sispol.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.dao.SimuladoDAO;
import br.com.puc.sispol.modelo.Simulado;

@Controller
public class SimuladoController {
	private SimuladoDAO daoSimulado;
	private AreaDeConhecimentoDAO daoAreaDeConhecimento;

	public SimuladoController() {
		this.daoSimulado = new SimuladoDAO();
		this.daoAreaDeConhecimento = new AreaDeConhecimentoDAO();
	}

	@RequestMapping("novoSimulado")
	public String form(Model model) {
		model.addAttribute("areasDeConhecimento", daoAreaDeConhecimento.lista());
		this.daoAreaDeConhecimento.lista();
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

		daoSimulado.adiciona(simulado);
		mv.addObject("sucesso", 1);
		return mv;
	}

}
