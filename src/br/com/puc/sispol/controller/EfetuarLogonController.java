package br.com.puc.sispol.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.puc.sispol.dao.UsuarioDAO;
import br.com.puc.sispol.modelo.Usuario;

@Controller
public class EfetuarLogonController {
	@RequestMapping("loginForm")
	public String loginForm() {
		return "logon";
	}

	@RequestMapping(value = "/efetuaLogin", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String efetuaLogin(@Valid Usuario usuario, BindingResult result,
			HttpSession session) {
		
		if (result.hasErrors()) {
			return "logon";
		}

		Usuario user = new Usuario();
		user = new UsuarioDAO().buscaPorLogin(usuario);
		if (new UsuarioDAO().existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", user);

			if (user.getPerfil().equals("ADMIN")) {
				return "redirect:areaAdmin";
			} else {
				return "redirect:areaUsuario";
			}
		}
		result.rejectValue("email", "email.notvalid", "E-mail ou Senha inválidos.");
		return "logon";
	}

	@RequestMapping("areaAdmin")
	public String areaAdmin(HttpSession session) {
		return "area_admin";
	}

	@RequestMapping("areaUsuario")
	public String areaUsuario(HttpSession session) {
		return "area_usuario";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		System.out.println("Deslogando...");
		session.invalidate();
		return "redirect:loginForm";
	}

}
