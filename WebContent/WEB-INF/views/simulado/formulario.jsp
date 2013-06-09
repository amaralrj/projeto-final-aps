<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />
<div class="container-fluid">
			<div class="row-fluid">
				<div class="pull-left span4">
					<ul class="nav  nav-pills nav-stacked"></ul>
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
				<li><a href="home.html"><i class="icon-home"></i> Home</a> <span
					class="divider">/</span></li>
				<li><a href="area_admin.html">�rea de Administra��o</a> <span
					class="divider">/</span></li>
				<li class="active">Criar Simulado</li>
			</ol>
			<form class="form-signin form-horizontal">
				<fieldset>
					<legend>Criar Simulado</legend>
					<div class="control-group">
						<label class="control-label">*T�tulo</label>
						<div class="controls">
							<input id="nomeusr" name="nomeusr" type="text"
								placeholder="T�tulo do Simulado" class="input-xlarge"
								required=""
								data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
								value="" />
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*�rea de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="3" style="">
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Portugu�s</option>
								<option>Inform�tica</option>
							</select> <label class="span1 control-label">*N�mero de Quest�es</label>
							<input class="span2" type="text" placeholder="N�m. de Quest�es" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�rea de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Portugu�s</option>
								<option>
									Inform�tica
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*N�mero de Quest�es</label>
							<input class="span2" type="text" placeholder="N�m. de Quest�es" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�rea de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Portugu�s</option>
								<option>
									Inform�tica
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*N�mero de Quest�es</label>
							<input class="span2" type="text" placeholder="N�m. de Quest�es" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�rea de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Portugu�s</option>
								<option>
									Inform�tica
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*N�mero de Quest�es</label>
							<input class="span2" type="text" placeholder="N�m. de Quest�es" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�rea de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Portugu�s</option>
								<option>
									Inform�tica
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*N�mero de Quest�es</label>
							<input class="span2" type="text" placeholder="N�m. de Quest�es" />
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*Data de Realiza��o</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Data de realiza��o do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">*Hora de Realiza��o</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Hora de realiza��o do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">*Dura��o</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Dura��o do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">*Pontua��o M�nima</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Pontua��o M�nima do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<label class="control-label">* Campos obrigat�rios</label>
							<div></div>
						</div>
					</div>
				</fieldset>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary ">Criar
						Simulado</button>
				</div>
			</form>
		</div>
	</div>
<c:import url="../rodape.jsp" />