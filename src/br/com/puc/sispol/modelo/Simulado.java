package br.com.puc.sispol.modelo;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Simulado {
	private Long codSimulado;
	
	private List<Questao> questoes;
	
	public List<Questao> getQuestoes() {
		return questoes;
	}

	public void setQuestoes(List<Questao> questoes) {
		this.questoes = questoes;
	}

	@NotNull(message = "A Data deve ser preenchida.")
	@DateTimeFormat(pattern="dd/MM/YYYY")
	private Calendar dataDeRealizacao;
	
	@NotEmpty(message = "A Hora deve ser preenchida.")
	private String horaDeRealizacao;
	
	public Long getCodSimulado() {
		return codSimulado;
	}

	public void setCodSimulado(Long codSimulado) {
		this.codSimulado = codSimulado;
	}

	public String getHoraDeRealizacao() {
		return horaDeRealizacao;
	}

	public void setHoraDeRealizacao(String horaDeRealizacao) {
		this.horaDeRealizacao = horaDeRealizacao;
	}

	//@NotEmpty(message = "A Hora deve ser preenchida.")
	@NotNull(message = "A Duração deve ser preenchida.")
	private Integer duracao;
	
	@NotNull(message = "A Pontuação deve ser preenchida.")
	private Integer pontuacaoMinima;

	@NotEmpty(message = "O Título deve ser preenchida.")
	private String titulo;
	
  
	public Calendar getDataDeRealizacao() {
		return dataDeRealizacao;
	}

	public void setDataDeRealizacao(Calendar dataDeRealizacao) {
		this.dataDeRealizacao = dataDeRealizacao;
	}

	
	public Integer getDuracao() {
		return duracao;
	}

	public void setDuracao(Integer duracao) {
		this.duracao = duracao;
	}

	public Integer getPontuacaoMinima() {
		return pontuacaoMinima;
	}

	public void setPontuacaoMinima(Integer pontuacaoMinima) {
		this.pontuacaoMinima = pontuacaoMinima;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


}
