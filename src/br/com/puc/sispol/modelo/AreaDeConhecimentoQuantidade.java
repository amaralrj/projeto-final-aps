package br.com.puc.sispol.modelo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class AreaDeConhecimentoQuantidade {
	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	private Long codAreaDeConhecimento;

	@NotNull(message = "O Título deve ser preenchido.")
	@Size(min = 5, message = "O Título deve ser preenchido.")
	@NotEmpty(message = "O Título deve ser preenchido.")
	private String titulo;
	
	private Integer quantidade;

	public Long getCodAreaDeConhecimento() {
		return codAreaDeConhecimento;
	}

	public void setCodAreaDeConhecimento(Long codAreaDeConhecimento) {
		this.codAreaDeConhecimento = codAreaDeConhecimento;
	}

	

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


}
