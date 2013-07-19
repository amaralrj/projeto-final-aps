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
			<li><a href="areaAdmin"><i class="icon-home"></i> Home</a> <span
				class="divider">/</span></li>
			<li><a href="areaAdmin">Área de Administração</a> <span
				class="divider">/</span></li>
			<li class="active">Incluir Questão</li>
		</ol>
		<form:errors path="*" />
		<form class="form-signin form-horizontal" action="adicionaQuestao"
			method="post">
			<fieldset>
				<legend>Incluir Questão</legend>
				<c:if test="${sucesso eq 1}">
					<div class="alert alert-success">Cadastro realizado com
						sucesso!</div>
				</c:if>

				<div class="control-group">
					<label class="control-label">*Enunciado</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Enunciado da questão"
							data-errormessage-value-missing="Campo obrigatório não preenchido."
							name="enunciado"></textarea>
						<form:errors path="questao.enunciado" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Opção A</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da opção"
							data-errormessage-value-missing="Campo obrigatório não preenchido."
							name="opcaoA"></textarea>
						<form:errors path="questao.opcaoA" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Opção B</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da opção"
							data-errormessage-value-missing="Campo obrigatório não preenchido."
							name="opcaoB"></textarea>
						<form:errors path="questao.opcaoB" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Opção C</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da opção"
							data-errormessage-value-missing="Campo obrigatório não preenchido."
							name="opcaoC"></textarea>
						<form:errors path="questao.opcaoC" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Opção D</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da opção"
							data-errormessage-value-missing="Campo obrigatório não preenchido."
							name="opcaoD"></textarea>
						<form:errors path="questao.opcaoD" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Opção E</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da opção"
							data-errormessage-value-missing="Campo obrigatório não preenchido."
							name="opcaoE"></textarea>
						<form:errors path="questao.opcaoE" class="text-error" />
					</div>
				</div>
				<!-- Select Basic -->
				<div class="control-group">
					<label class="control-label">Opção Correta</label>
					<div class="controls">
						<select id="escolaridadeusr" name="opcaoCorreta"
							class="input-xlarge" default="2" style="">
							<option value="A">Opção A</option>
							<option value="B">Opção B</option>
							<option value="C">Opção C</option>
							<option value="D">Opção D</option>
							<option value="E">Opção E</option>
						</select>
						<form:errors path="questao.opcaoCorreta" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Área de Conhecimento</label>
					<div class="controls">
						<select id="areaDeConhecimento.codAreaDeConhecimento"
							name="areaDeConhecimento.codAreaDeConhecimento"
							class="input-xlarge span2">
							<c:forEach items="${areasDeConhecimento}"
								var="areaDeConhecimento">
								<option value="${areaDeConhecimento.codAreaDeConhecimento}">${areaDeConhecimento.titulo}</option>
							</c:forEach>
						</select>

					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Concurso</label>
					<div class="controls">
						<select id="concurso.codConcurso"
							name="concurso.codConcurso"
							class="input-xlarge span2">
							<c:forEach items="${concursos}"
								var="concurso">
								<option value="${concurso.codConcurso}">${concurso.titulo}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="control-label">* Campos obrigatórios</label>
						<div></div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary ">Incluir</button>
			</div>
		</form>
	</div>
</div>

<c:import url="../rodape.jsp" />