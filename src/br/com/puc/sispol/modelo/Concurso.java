package br.com.puc.sispol.modelo;


public class Concurso {
	private Long codConcurso;

	private String titulo;

	public Long getCodConcurso() {
		return codConcurso;
	}

	public void setCodConcurso(Long codConcurso) {
		this.codConcurso = codConcurso;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
}