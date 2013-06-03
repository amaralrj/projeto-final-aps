<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../cabecalho.jsp" />
</head>
<body>
	<c:import url="../menu.jsp" />
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="pull-left span1">
				<ul class="nav  nav-pills nav-stacked"></ul>
			</div>
			<div class="pull-left span7">
				<div class="row-fluid">
					<div class="span4">
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="row">
		<div class="span1">
			<a> </a>
		</div>
		<div class="span11">
			<ol class="breadcrumb">
				<li><a href="mostraHome"> <i class="icon-home"></i> Home
				</a> <span class="divider">/</span></li>
				<li class="active">Cadastro de Usu�rio</li>
			</ol>
			<form class="form-horizontal">
				<legend>Cadastro de Usu�rio</legend>
				<fieldset>
					<div class="control-group">
						<label class="control-label">*Nome</label>
						<div class="controls">
							<input id="nomeusr" name="nomeusr" type="text"
								placeholder="Nome do usu�rio" class="input-xlarge" required="">
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*Sobrenome</label>
						<div class="controls">
							<input id="sobrenomeusr" name="sobrenomeusr" type="text"
								placeholder="Sobrenome do usu�rio" class="input-xlarge"
								required="">
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*E-mail</label>
						<div class="controls">
							<input id="emailusr" name="emailusr" type="text"
								placeholder="Endere�o de e-mail" class="input-xlarge"
								required="">
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*Data de Nascimento</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Data de nascimento"
								class="input-xlarge" required="">
						</div>
					</div>
					<!-- Select Basic -->
					<div class="control-group">
						<label class="control-label">Escolaridade</label>
						<div class="controls">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge">
								<option>1o grau completo</option>
								<option>2o grau completo</option>
								<option>Curso Superior completo</option>
								<option>P�s-Gradua��o</option>
								<option>Mestrado</option>
								<option>Doutorado</option>
							</select>
						</div>
					</div>
					<!-- Password input-->
					<div class="control-group">
						<label class="control-label">*Senha</label>
						<div class="controls">
							<input id="senha1usr" name="senha1usr" type="password"
								placeholder="Senha" class="input-xlarge" required="">
						</div>
					</div>
					<!-- Password input-->
					<div class="control-group">
						<label class="control-label">*Confirmar Senha</label>
						<div class="controls">
							<input id="senha2usr" name="senha2usr" type="password"
								placeholder="Confirme a sua senha" class="input-xlarge"
								required="">
						</div>
					</div>
					<!-- Multiple Checkboxes -->
					<div class="control-group">
						<label class="control-label">Deseja receber notifica��es ?</label>
						<div class="controls">
							<label class="checkbox"> <input type="checkbox"
								name="notificausr"
								value="Sim. Gostaria de receber notifica��es."> Sim.
								Gostaria de receber notifica��es.
							</label>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<label class="control-label">* Campos obrigat�rios</label>
							<div></div>
				</fieldset>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Enviar</button>
				</div>
			</form>
		</div>
	</div>
	<c:import url="../rodape.jsp" />