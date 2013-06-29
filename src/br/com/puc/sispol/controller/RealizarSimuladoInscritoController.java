package br.com.puc.sispol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.puc.sispol.dao.ResultadoDAO;
import br.com.puc.sispol.dao.SimuladoDAO;
import br.com.puc.sispol.modelo.Resposta;
import br.com.puc.sispol.modelo.Resultado;
import br.com.puc.sispol.modelo.Simulado;

@Controller
public class RealizarSimuladoInscritoController {
	private SimuladoDAO daoSimulado;
	private ResultadoDAO daoResultado;

	
	public RealizarSimuladoInscritoController() {
		this.daoSimulado = new SimuladoDAO();
		this.daoResultado = new ResultadoDAO();

	}

	@RequestMapping("realizaSimulado")
	public String realiza(Long codUsuario, Model model) {

		try {
			
			Simulado simulado = daoSimulado
					.busca(codUsuario);
			
			model.addAttribute("simulado", simulado);
			
			Resultado resultado = daoResultado.busca(codUsuario, simulado);

			model.addAttribute("resultado", resultado);
			
			System.out.println("Usuário: "+codUsuario + " realiza Simulado: " + simulado.getTitulo() + " Resulado: " + resultado.getCodResultado());
			
			

			return "realizar_simulado_inscrito/formulario";
		} catch (NullPointerException e) {
			
			  System.out.println("Ocorreu um NullPointerExdoception ao executar o método realiza() "+e);

			return "realizar_simulado_inscrito/falha";
		}
	}
	
	@RequestMapping("adicionaResultado")
	public String adicionaResultado(Resultado resultado) {
		
			//grava as respotas respondidas
			System.out.println("Zera resultado: " + resultado);
			
			//Zerar respostas para o resultado Caso ja tenha entregue a prova
			daoResultado.apagaRespostas(resultado);
			
			for(Resposta r: resultado.getRespostas()){
				r.setResultado(resultado);
				System.out.println(" OpcaoEscolhida: "+r.getOpcaoEscolhida());
				System.out.println(" Questao: "+r.getQuestao().getCodQuestao());
				daoResultado.adicionaResposta(r);
				//insere resposta na tabela resposta;
			}

			return "realizar_simulado_inscrito/ok";
	}

}
