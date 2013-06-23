package br.com.puc.sispol.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.puc.sispol.dao.SimuladoDAO;
import br.com.puc.sispol.modelo.AreaDeConhecimentoQuantidade;
import br.com.puc.sispol.modelo.Simulado;

@Controller
public class RealizarSimuladoInscritoController {
	private SimuladoDAO daoSimulado;

	public RealizarSimuladoInscritoController() {
		this.daoSimulado = new SimuladoDAO();
	}

	@RequestMapping("realizaSimulado")
	public String realiza(Long codUsuario, Model model) {

		//try {
			// Existe simulado ?
			// Se sim mostra o formulario
			// Se não mostra msg nao existe simulado inscrito
			Simulado simulado = daoSimulado
					.buscaSimuladoASerRealizado(codUsuario);
			
			model.addAttribute("simulado", simulado);
			List<AreaDeConhecimentoQuantidade> lista = new ArrayList<AreaDeConhecimentoQuantidade>();
			lista = daoSimulado.buscaAreasDeConhecimentoDoSimulado(simulado);

			for (AreaDeConhecimentoQuantidade a : lista) {
				System.out.println("area de co: " + a.getTitulo());
			}
			model.addAttribute("areasDeConhecimento", lista);
			model.addAttribute("questoes", daoSimulado.buscaQuestoesDoSimulado(simulado));
			
			
			
			return "realizar_simulado_inscrito/formulario";
		//} catch (Exception e) {
			//return "realizar_simulado_inscrito/falha";
		//}
	}

}
