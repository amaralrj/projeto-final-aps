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
			<li class="active">Alterar Quest�o</li>
		</ol>
		<form:errors path="*" />
		<form class="form-signin form-horizontal" action="alteraQuestao" method="post">
			<fieldset>
				<legend>Alterar Quest�o</legend>
				<c:if test="${sucesso eq 1}">
					<div class="alert alert-success">Cadastro alterado com
						sucesso!</div>
				</c:if>
				<!-- Text input-->
				<input type="hidden" name="codQuestao" value="${questao.codQuestao}">
				<div class="control-group">
					<label class="control-label">*Enunciado</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Enunciado da quest�o"
							data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
							name="enunciado">${questao.enunciado}</textarea>
						<form:errors path="questao.enunciado" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Op��o A</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da op��o"
							data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
							name="opcaoA">${questao.opcaoA}</textarea>
						<form:errors path="questao.opcaoA" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Op��o B</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da op��o"
							data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
							name="opcaoB">${questao.opcaoB}</textarea>
						<form:errors path="questao.opcaoB" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Op��o C</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da op��o"
							data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
							name="opcaoC">${questao.opcaoC}</textarea>
						<form:errors path="questao.opcaoC" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Op��o D</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da op��o"
							data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
							name="opcaoD">${questao.opcaoD}</textarea>
						<form:errors path="questao.opcaoD" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Op��o E</label>
					<div class="controls">
						<textarea rows="3"
							style="margin-left: 0; margin-right: 0; width: 271px;"
							placeholder="Texto da op��o"
							data-errormessage-value-missing="Campo obrigat�rio n�o preenchido."
							name="opcaoE">${questao.opcaoE}</textarea>
						<form:errors path="questao.opcaoE" class="text-error" />
					</div>
				</div>
				<!-- Select Basic -->
				<div class="control-group">
					<label class="control-label">Op��o Correta</label>
					<div class="controls">
						<select id="escolaridadeusr" name="opcaoCorreta"
							class="input-xlarge" default="2" style="">
							<option value="A" <c:if test="${questao.opcaoCorreta == 'A'}">selected</c:if> >Op��o A</option>
							<option value="B" <c:if test="${questao.opcaoCorreta == 'B'}">selected</c:if> >Op��o B</option>
							<option value="C" <c:if test="${questao.opcaoCorreta == 'C'}">selected</c:if> >Op��o C</option>
							<option value="D" <c:if test="${questao.opcaoCorreta == 'D'}">selected</c:if> >Op��o D</option>
							<option value="E" <c:if test="${questao.opcaoCorreta == 'E'}">selected</c:if> >Op��o E</option>
						</select>
						<form:errors path="questao.opcaoCorreta" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*�rea de Conhecimento</label>
					<div class="controls">
						<select id="areaDeConhecimento.codAreaDeConhecimento"
							name="areaDeConhecimento.codAreaDeConhecimento"
							class="input-xlarge span2">
							<c:forEach items="${areasDeConhecimento}"
								var="areaDeConhecimento">
								<option value="${areaDeConhecimento.codAreaDeConhecimento}" <c:if test="${questao.areaDeConhecimento.codAreaDeConhecimento == areaDeConhecimento.codAreaDeConhecimento}">selected</c:if>>${areaDeConhecimento.titulo}</option>
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
								<option value="${concurso.codConcurso}" <c:if test="${questao.concurso.codConcurso == concurso.codConcurso}">selected</c:if>>${concurso.titulo}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="control-label">* Campos obrigat�rios</label>
						<div></div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary ">Alterar</button>
			</div>

		</form>
	</div>
</div>
<c:import url="../rodape.jsp" />