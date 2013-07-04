package br.com.puc.sispol.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.puc.sispol.dao.ResultadoDAO;
import br.com.puc.sispol.dao.SimuladoDAO;
import br.com.puc.sispol.modelo.Resultado;
import br.com.puc.sispol.modelo.Simulado;

@Controller
public class ConsultarClassificacaoSimuladoController {

	private SimuladoDAO daoSimulado;
	private ResultadoDAO daoResultado;

	public ConsultarClassificacaoSimuladoController() {
		this.daoSimulado = new SimuladoDAO();
		this.daoResultado = new ResultadoDAO();
	}

	@RequestMapping("consultarClassificacaoSimulado")
	public String consultarClassificacaoSimulado(Model model) {
		model.addAttribute("simulados", daoSimulado.listaUltimosSimuladosRealizados());
		return "consultar_classificacao_simulado/consultar_classificacao_simulado";
	}
	
	@RequestMapping("classificacaoSimulado")
	public String classificacaoSimulado(Simulado simulado, Model model) {
		
		simulado = daoSimulado.buscaPorCodigo(simulado.getCodSimulado());
		model.addAttribute("simulado", simulado);
		
		List<Resultado> resultados = daoResultado.buscaResultadosDoSimulado(simulado);
		model.addAttribute("resultados", resultados);
		
		return "consultar_classificacao_simulado/classificacao_simulado";
	}

}
