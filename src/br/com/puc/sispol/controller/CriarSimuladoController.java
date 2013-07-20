package br.com.puc.sispol.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.dao.QuestaoDAO;
import br.com.puc.sispol.dao.SimuladoDAO;
import br.com.puc.sispol.modelo.AreaDeConhecimento;
import br.com.puc.sispol.modelo.Questao;
import br.com.puc.sispol.modelo.Simulado;

@Controller
public class CriarSimuladoController {
	private SimuladoDAO daoSimulado;
	private AreaDeConhecimentoDAO daoAreaDeConhecimento;
	private QuestaoDAO daoQuestao;

	public CriarSimuladoController() {
		this.daoSimulado = new SimuladoDAO();
		this.daoAreaDeConhecimento = new AreaDeConhecimentoDAO();
		this.daoQuestao = new QuestaoDAO();
	}

	@RequestMapping("novoSimulado")
	public String form(Model model) {
		model.addAttribute("areasDeConhecimento", daoAreaDeConhecimento.lista());
		return "criar_simulado/criar_simulado";
	}

	@RequestMapping("adicionaSimulado")
	public ModelAndView adiciona(HttpServletRequest request,
			@Valid Simulado simulado, BindingResult result) {

		ModelAndView mv = new ModelAndView("criar_simulado/criar_simulado_sucesso");
		mv.addObject("areasDeConhecimento", daoAreaDeConhecimento.lista());
		int i = 0;
		List<Questao> questoes = new ArrayList<Questao>();
		while (request.getParameter("areaDeConhecimento[" + i + "]") != null) {

			if (request.getParameter("numQuestoes[" + i + "]") == "") {
				
				mv = new ModelAndView("criar_simulado/criar_simulado");
				mv.addObject("areasDeConhecimento", daoAreaDeConhecimento.lista());
				return mv;
			}

			questoes.addAll(daoQuestao.listaParaSimulado(
					Long.parseLong(
							request.getParameter("areaDeConhecimento[" + i
									+ "]"), 10),
					Long.parseLong(
							request.getParameter("numQuestoes[" + i + "]"), 10)));
			i++;
		}

		simulado.setQuestoes(questoes);

		if (result.hasFieldErrors()) {
			mv = new ModelAndView("criar_simulado/criar_simulado");
			mv.addObject("areasDeConhecimento", daoAreaDeConhecimento.lista());
			return mv;
		}
		Long codSimulado = daoSimulado.adiciona(simulado);
		System.out.println("Codigo simulado: "+ codSimulado);
		mv.addObject("simulado", daoSimulado.buscaPorCodigo(codSimulado));
		mv.addObject("sucesso", 1);
		return mv;
	}

}
