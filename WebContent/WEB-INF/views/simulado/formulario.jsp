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
				<li><a href="area_admin.html">Área de Administração</a> <span
					class="divider">/</span></li>
				<li class="active">Criar Simulado</li>
			</ol>
			<form class="form-signin form-horizontal">
				<fieldset>
					<legend>Criar Simulado</legend>
					<div class="control-group">
						<label class="control-label">*Título</label>
						<div class="controls">
							<input id="nomeusr" name="nomeusr" type="text"
								placeholder="Título do Simulado" class="input-xlarge"
								required=""
								data-errormessage-value-missing="Campo obrigatório não preenchido."
								value="" />
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*Área de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="3" style="">
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Português</option>
								<option>Informática</option>
							</select> <label class="span1 control-label">*Número de Questões</label>
							<input class="span2" type="text" placeholder="Núm. de Questões" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Área de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Português</option>
								<option>
									Informática
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*Número de Questões</label>
							<input class="span2" type="text" placeholder="Núm. de Questões" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Área de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Português</option>
								<option>
									Informática
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*Número de Questões</label>
							<input class="span2" type="text" placeholder="Núm. de Questões" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Área de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Português</option>
								<option>
									Informática
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*Número de Questões</label>
							<input class="span2" type="text" placeholder="Núm. de Questões" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Área de Conhecimento</label>
						<div class="controls controls-row">
							<select id="escolaridadeusr" name="escolaridadeusr"
								class="input-xlarge span2" default="2" style="">
								<option>Nenhum</option>
								<option>Direito do Trabalho</option>
								<option>Direito Constitucional</option>
								<option>Português</option>
								<option>
									Informática
									<!--	option-->
								</option>
							</select> <label class="span1 control-label">*Número de Questões</label>
							<input class="span2" type="text" placeholder="Núm. de Questões" />
						</div>
					</div>
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*Data de Realização</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Data de realização do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigatório não preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">*Hora de Realização</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Hora de realização do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigatório não preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">*Duração</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Duração do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigatório não preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">*Pontuação Mínima</label>
						<div class="controls">
							<input id="datanascimentousr" name="datanascimentousr"
								type="text" placeholder="Pontuação Mínima do Simulado"
								class="input-xlarge" required=""
								data-errormessage-value-missing="Campo obrigatório não preenchido."
								value="" />
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<label class="control-label">* Campos obrigatórios</label>
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