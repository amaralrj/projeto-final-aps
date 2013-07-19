package br.com.puc.sispol.modelo;

import org.hibernate.validator.constraints.NotEmpty;


public class Questao {
	
	private Long codQuestao;
	private AreaDeConhecimento areaDeConhecimento;
	private Concurso concurso;
	
	@NotEmpty(message = "A Opcao A deve ser preenchida.")
	private String opcaoA;
	
	@NotEmpty(message = "A Opcao B deve ser preenchida.")
	private String opcaoB;
	
	@NotEmpty(message = "A Opcao C deve ser preenchida.")
	private String opcaoC;
	
	@NotEmpty(message = "A Opcao D deve ser preenchida.")
	private String opcaoD;
	
	@NotEmpty(message = "A Opcao E deve ser preenchida.")
	private String opcaoE;
	
	@NotEmpty(message = "A Opcao Correta deve ser preenchida.")
	private String opcaoCorreta;
	
	@NotEmpty(message = "O Enunciado deve ser preenchido.")
	private String enunciado;
	
	
	public AreaDeConhecimento getAreaDeConhecimento() {
		return areaDeConhecimento;
	}
	public void setAreaDeConhecimento(AreaDeConhecimento areaDeConhecimento) {
		this.areaDeConhecimento = areaDeConhecimento;
	}
	public Concurso getConcurso() {
		return concurso;
	}
	public void setConcurso(Concurso concurso) {
		this.concurso = concurso;
	}
	public String getOpcaoCorreta() {
		return opcaoCorreta;
	}
	public void setOpcaoCorreta(String opcaoCorreta) {
		this.opcaoCorreta = opcaoCorreta;
	}
	
	
	public String getOpcaoA() {
		return opcaoA;
	}
	public void setOpcaoA(String opcaoA) {
		this.opcaoA = opcaoA;
	}
	public String getOpcaoB() {
		return opcaoB;
	}
	public void setOpcaoB(String opcaoB) {
		this.opcaoB = opcaoB;
	}
	public String getOpcaoC() {
		return opcaoC;
	}
	public void setOpcaoC(String opcaoC) {
		this.opcaoC = opcaoC;
	}
	public String getOpcaoD() {
		return opcaoD;
	}
	public void setOpcaoD(String opcaoD) {
		this.opcaoD = opcaoD;
	}
	public String getOpcaoE() {
		return opcaoE;
	}
	public void setOpcaoE(String opcaoE) {
		this.opcaoE = opcaoE;
	}
	public String getEnunciado() {
		return enunciado;
	}
	public void setEnunciado(String enunciado) {
		this.enunciado = enunciado;
	}
	public Long getCodQuestao() {
		return codQuestao;
	}
	public void setCodQuestao(Long codQuestao) {
		this.codQuestao = codQuestao;
	}

}
