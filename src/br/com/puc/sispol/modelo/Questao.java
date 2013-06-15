package br.com.puc.sispol.modelo;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Questao {
	
	private Long codQuestao;
	private Long codAreaDeConhecimento;
	public Long getCodQuestao() {
		return codQuestao;
	}
	public void setCodQuestao(Long codQuestao) {
		this.codQuestao = codQuestao;
	}
	public Long getCodAreaDeConhecimento() {
		return codAreaDeConhecimento;
	}
	public void setCodAreaDeConhecimento(Long codAreaDeConhecimento) {
		this.codAreaDeConhecimento = codAreaDeConhecimento;
	}
	
	
	

}
