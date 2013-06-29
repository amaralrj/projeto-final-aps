package br.com.puc.sispol.modelo;

import java.util.List;

public class Resultado {
	private Long codResultado;

	private Integer notaDoSimulado;

	private Simulado simulado;

	private Usuario usuario;

	private List<Resposta> respostas;

	public Long getCodResultado() {
		return codResultado;
	}

	public void setCodResultado(Long codResultado) {
		this.codResultado = codResultado;
	}

	public Integer getNotaDoSimulado() {
		return notaDoSimulado;
	}

	public void setNotaDoSimulado(Integer notaDoSimulado) {
		this.notaDoSimulado = notaDoSimulado;
	}

	public Simulado getSimulado() {
		return simulado;
	}

	public void setSimulado(Simulado simulado) {
		this.simulado = simulado;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<Resposta> getRespostas() {
		return respostas;
	}

	public void setRespostas(List<Resposta> respostas) {
		this.respostas = respostas;
	}

	@Override
	public String toString() {
		return "codResultado:" + codResultado;
	}

}
