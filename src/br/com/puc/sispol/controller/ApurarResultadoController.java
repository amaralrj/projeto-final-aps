package br.com.puc.sispol.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.puc.sispol.dao.ResultadoDAO;

@Controller
public class ApurarResultadoController {

	private ResultadoDAO daoResultado;

	public ApurarResultadoController() {
		this.daoResultado = new ResultadoDAO();
	}


	/*
	 * @RequestMapping("finalizaTarefa") public String finaliza(Long id, Model
	 * model) { TarefaDAO dao = new TarefaDAO(); dao.finaliza(id);
	 * model.addAttribute("tarefa", dao.buscaPorId(id)); return
	 * "tarefa/finalizada"; }
	 */

	@RequestMapping("apuraResultado")
	public void apura(HttpServletResponse response) {
		System.out.println("Apurando Resultado...");
		daoResultado.apura();
		response.setStatus(200);
	}
}
