package br.com.puc.sispol.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.dao.ConcursoDAO;
import br.com.puc.sispol.dao.QuestaoDAO;
import br.com.puc.sispol.modelo.Questao;

@Controller
public class ManterQuestaoController {
	private QuestaoDAO dao;
	private AreaDeConhecimentoDAO daoAreaDeConhecimento;
	private ConcursoDAO daoConcurso;

	public ManterQuestaoController() {
		this.dao = new QuestaoDAO();
		this.daoAreaDeConhecimento = new AreaDeConhecimentoDAO();
		this.daoConcurso = new ConcursoDAO();
	}

	@RequestMapping("novaQuestao")
	public String form(Model model) {
		model.addAttribute("areasDeConhecimento", daoAreaDeConhecimento.lista());
		model.addAttribute("concursos", daoConcurso.lista());
		return "manter_questao/incluir_questao";
	}

	@RequestMapping("adicionaQuestao")
	public ModelAndView adiciona(@Valid Questao questao, BindingResult result) {

		ModelAndView mv = new ModelAndView("manter_questao/incluir_questao");
		// mv.addObject("tarefas", tarefas);
		mv.addObject("concursos", daoConcurso.lista());
		mv.addObject("areasDeConhecimento", daoAreaDeConhecimento.lista());
		if (result.hasFieldErrors()) {
			return mv;
		}

		dao.adiciona(questao);

		mv.addObject("sucesso", 1);
		return mv;
	}

	@RequestMapping("consultarQuestao")
	public ModelAndView consulta(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("manter_questao/consultar_questao");
		mv.addObject("concursos", daoConcurso.lista());
		mv.addObject("areasDeConhecimento", daoAreaDeConhecimento.lista());
		if (request.getParameter("areaDeConhecimento.codAreaDeConhecimento") != null) {
			List<Questao> questoes = dao.buscaPorFiltro(Long.parseLong(request
					.getParameter("areaDeConhecimento.codAreaDeConhecimento"),
					10), Long.parseLong(
					request.getParameter("concurso.codConcurso"), 10));
			mv.addObject("questoes", questoes);
		}
		return mv;
	}

	@RequestMapping("excluirQuestao")
	public void exclui(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("call excluirQuestao()");
		if (request.getParameter("codigo") != null) {
			dao.remove(Long.parseLong(request.getParameter("codigo"), 10));
		}
		System.out.println("Redireciana para consulta");
		try {
			response.sendRedirect("consultarQuestao");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("alterarQuestao")
	public String alterar(HttpServletRequest request, Model model) {
		System.out.println("call alteraQuestao()");
		if (request.getParameter("codigo") != null) {
			model.addAttribute("questao", dao.busca((Long.parseLong(
					request.getParameter("codigo"), 10))));
		}
		model.addAttribute("concursos", daoConcurso.lista());
		model.addAttribute("areasDeConhecimento", daoAreaDeConhecimento.lista());

		return "manter_questao/alterar_questao";
	}

	@RequestMapping("alteraQuestao")
	public ModelAndView altera(@Valid Questao questao, BindingResult result) {
		ModelAndView mv = new ModelAndView("manter_questao/alterar_questao");

		if (result.hasFieldErrors()) {
			return mv;
		}

		dao.altera(questao);

		mv.addObject("sucesso", 1);
		return mv;
	}

}
