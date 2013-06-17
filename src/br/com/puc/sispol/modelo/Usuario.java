package br.com.puc.sispol.modelo;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Usuario {
	
	private Long codUsuario;
	
	public Long getCodUsuario() {
		return codUsuario;
	}

	public void setCodUsuario(Long codUsuario) {
		this.codUsuario = codUsuario;
	}

	@NotEmpty(message = "O e-mail deve ser preenchido.")
	@NotNull(message = "O e-mail deve ser preenchido.")
	private String email;
	
	private String nome;

	@NotEmpty(message = "A senha deve ser preenchida.")
	@NotNull(message = "A senha deve ser preenchida.")
	private String senha;

	private String perfil;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
