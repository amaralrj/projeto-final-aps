package br.com.puc.sispol.modelo;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Usuario {
	@NotEmpty(message = "O login deve ser preenchido.")
	@NotNull(message = "O login deve ser preenchido.")
	private String login;

	@NotEmpty(message = "A senha deve ser preenchida.")
	@NotNull(message = "A senha deve ser preenchida.")
	private String senha;

	private String perfil;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
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

}
