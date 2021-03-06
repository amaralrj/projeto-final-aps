<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet"
	href="resources/css/logon_form.css">
<c:import url="cabecalho.jsp" />
</head>
<body>
	<c:import url="menu.jsp" />
	<br />
	<div class="container">
		<form:errors path="*" />
		<form action="efetuaLogin" class="form-signin" method="POST">
			<legend>
				<h2 class="form-signin-heading">Favor efetuar login</h2>
			</legend>
			<div class="control-group">
				<div class="controls">
					<input type="text" name="email" class="input-block-level"
						placeholder="Endere�o de Email" />
					<form:errors path="usuario.email" class="text-error" />

				</div>
			</div>
			<br />
			<div class="control-group">
				<div class="controls">
					<input type="password" name="senha" class="input-block-level"
						placeholder="Senha" />
					<form:errors path="usuario.senha" class="text-error" />
				</div>
			</div>
			<button class="btn btn-large btn-primary" type="submit">Logon</button>
	      <div>
    	    <br>
        	<a href="#">Recuperar Senha.</a>
      	  </div>			
		</form>
	</div>
	<c:import url="rodape.jsp" />