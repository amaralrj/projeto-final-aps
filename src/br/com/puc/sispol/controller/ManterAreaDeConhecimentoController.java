package br.com.puc.sispol.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.puc.sispol.dao.AreaDeConhecimentoDAO;
import br.com.puc.sispol.modelo.AreaDeConhecimento;

@Controller
public class ManterAreaDeConhecimentoController {
	private AreaDeConhecimentoDAO dao;

	public ManterAreaDeConhecimentoController() {
		this.dao = new AreaDeConhecimentoDAO();
	}

	@RequestMapping("novaAreaDeConhecimento")
	public String form() {
		return "manter_area_de_conhecimento/incluir_area_de_conhecimento";
	}

	@RequestMapping("adicionaAreaDeConhecimento")
	public ModelAndView adiciona(@Valid AreaDeConhecimento areaDeConhecimento,
			BindingResult result) {

		ModelAndView mv = new ModelAndView(
				"manter_area_de_conhecimento/incluir_area_de_conhecimento");
		// mv.addObject("tarefas", tarefas);

		if (result.hasFieldErrors()) {
			return mv;
		}

		dao.adiciona(areaDeConhecimento);
		mv.addObject("sucesso", 1);
		return mv;
	}

	@RequestMapping("consultarAreaDeConhecimento")
	public ModelAndView consulta(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView(
				"manter_area_de_conhecimento/consultar_area_de_conhecimento");

		if (request.getParameter("titulo") != null) {
			List<AreaDeConhecimento> areasDeConhecimento = dao
					.buscaPorTitulo(request.getParameter("titulo"));
			mv.addObject("areasDeConhecimento", areasDeConhecimento);
		}
		return mv;
	}
	
	@RequestMapping("detalharAreaDeConhecimento")
	public ModelAndView detalha(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView(
				"manter_area_de_conhecimento/detalhar_area_de_conhecimento");

		if (request.getParameter("codAreaDeconhecimento") != null) {
			mv.addObject("areaDeConhecimento", dao.busca( Long.parseLong(request.getParameter("codAreaDeconhecimento"),10)));
		}
		return mv;
	}

}
