package br.com.puc.sispol.modelo;

import java.util.Calendar;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Simulado {
	private Long id;

	@NotNull(message = "O Título deve ser preenchido.")
	@Size(min = 5, message = "O Título deve ser preenchido.")
	@NotEmpty(message = "O Título deve ser preenchido.")
	private String titulo;
	
	@NotNull(message = "A Descrição deve ser preenchida.")
	@NotEmpty(message = "O Descrição deve ser preenchido.")
	private String descricao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
