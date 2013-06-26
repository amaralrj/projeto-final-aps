package br.com.puc.sispol.modelo;

public class Resposta {
	private Long codResposta;
	
	public Long getCodResposta() {
		return codResposta;
	}

	public void setCodResposta(Long codResposta) {
		this.codResposta = codResposta;
	}

	public String getOpcaoEscolhida() {
		return opcaoEscolhida;
	}

	public void setOpcaoEscolhida(String opcaoEscolhida) {
		this.opcaoEscolhida = opcaoEscolhida;
	}

	public Questao getQuestao() {
		return questao;
	}

	public void setQuestao(Questao questao) {
		this.questao = questao;
	}

	public Resultado getResultado() {
		return resultado;
	}

	public void setResultado(Resultado resultado) {
		this.resultado = resultado;
	}

	private String opcaoEscolhida;
	
	private Questao questao;
	
	private Resultado resultado;
}
