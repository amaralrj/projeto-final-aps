package br.com.puc.sispol.modelo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class AreaDeConhecimento {
	private Long codAreaDeConhecimento;

	@NotNull(message = "O Título deve ser preenchido.")
	@Size(min = 5, message = "O Título deve ser preenchido.")
	@NotEmpty(message = "O Título deve ser preenchido.")
	private String titulo;
	
	@NotNull(message = "A Descrição deve ser preenchida.")
	@NotEmpty(message = "A Descrição deve ser preenchida.")
	private String descricao;

	public Long getCodAreaDeConhecimento() {
		return codAreaDeConhecimento;
	}

	public void setCodAreaDeConhecimento(Long codAreaDeConhecimento) {
		this.codAreaDeConhecimento = codAreaDeConhecimento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


}
