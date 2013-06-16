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
public class SimuladoController {
	private SimuladoDAO daoSimulado;
	private AreaDeConhecimentoDAO daoAreaDeConhecimento;
	private QuestaoDAO daoQuestao;

	public SimuladoController() {
		this.daoSimulado = new SimuladoDAO();
		this.daoAreaDeConhecimento = new AreaDeConhecimentoDAO();
		this.daoQuestao = new QuestaoDAO();
	}

	@RequestMapping("novoSimulado")
	public String form(Model model) {
		List<AreaDeConhecimento> areasDeConhecimento = daoAreaDeConhecimento
				.lista();
		for (AreaDeConhecimento ac : areasDeConhecimento) {
			System.out.println("cod area de conneimento: "
					+ ac.getCodAreaDeConhecimento());
		}
		model.addAttribute("areasDeConhecimento", areasDeConhecimento);
		return "simulado/formulario";
	}

	@RequestMapping("adicionaSimulado")
	public ModelAndView adiciona(HttpServletRequest request,
			@Valid Simulado simulado, BindingResult result) {

		int i = 0;
		List<Questao> questoes = new ArrayList<Questao>();
		while (request.getParameter("areaDeConhecimento[" + i + "]") != null) {
			questoes.addAll(daoQuestao.listaParaSimulado(
					request.getParameter("areaDeConhecimento[" + i + "]"),
					request.getParameter("numQuestoes[" + i + "]")));
			i++;
		}

		simulado.setQuestoes(questoes);

		for (Questao q : questoes) {
			System.out.println("Cod area de cinhecimento: "
					+ q.getCodAreaDeConhecimento() + " Cod questao: "
					+ q.getCodQuestao());
		}

		// ArrayList ac = request.getParameter("areaDeConhecimento");
		ModelAndView mv = new ModelAndView("simulado/formulario");
		// mv.addObject("tarefas", tarefas);

		if (result.hasFieldErrors()) {
			return mv;
		}

		daoSimulado.adiciona(simulado);
		mv.addObject("sucesso", 1);
		return mv;
	}
	
	@RequestMapping("listaSimuladosAguardandoInscricao")
	public String listaSimuladosAguardandoInscricao(Model model) {
		model.addAttribute("simulados", daoSimulado.listaAguardandoInscricao());
		return "simulado/lista_simulados_aguardando_inscricao";
	}
}
