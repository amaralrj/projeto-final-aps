<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalho.jsp" />
<c:import url="menu.jsp" />
<br />
<div class="container">
	<form action="efetuaLogin" class="form-signin" method="POST">
		<legend>
			<h2 class="form-signin-heading">Favor logar-se</h2>
		</legend>
		<input type="text" name="login" class="input-block-level"
			placeholder="Endereço de Email" /> <input type="password"
			name="senha" class="input-block-level" placeholder="Senha" />
		<button class="btn btn-large btn-primary" type="submit">Logon</button>
	</form>
</div>
<c:import url="rodape.jsp" />