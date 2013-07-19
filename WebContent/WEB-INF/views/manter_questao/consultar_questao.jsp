<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			<li class="active">Consultar Questão</li>
		</ol>
		<form action="consultarQuestao" method="post">
			<fieldset>
				<legend>Consultar Questão</legend>
				<div class="control-group">
					<label class="control-label" for="inputNome"> <b>Área
							de Conhecimento</b>
					</label>
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
				<div class="control-group">
					<label class="control-label" for="inputEmail"> <b>Concurso</b>
					</label>
					<div class="controls">
						<select id="concurso.codConcurso" name="concurso.codConcurso"
							class="input-xlarge span2">
							<c:forEach items="${concursos}" var="concurso">
								<option value="${concurso.codConcurso}">${concurso.titulo}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Consultar</button>
			</div>
		</form>
		<table
			class="table table-hover table-bordered table-condensed table-striped">
			<caption>
				<b><h4 class="pull-left">Lista de Questões</h4></b>
			</caption>
			<thead>
				<tr>
					<th>#</th>
					<th>Enunciado</th>
					<th>Área de Conhecimento</th>
					<th>Concurso</th>
					<th>Operação</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${questoes}" var="questao">
					<tr>
						<td>${questao.codQuestao}</td>
						<td><c:out value="${fn:substring(questao.enunciado,0,50)}"/></td>
						<td>${questao.areaDeConhecimento.titulo}</td>
						<td>${questao.concurso.titulo}</td>
						<td><a href="#modal_detalhar_${questao.codQuestao}"
							role="button" class="btn" data-toggle="modal">Detalhar</a> <a
							href="alterarQuestao?codigo=${questao.codQuestao}" role="button"
							class="btn">Alterar</a> <a
							href="#modal_excluir_${questao.codQuestao}" role="button"
							class="btn" data-toggle="modal">Excluir</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
<c:forEach items="${questoes}" var="questao">
	<!-- Modal Excluir -->
	<div id="modal_excluir_${questao.codQuestao}" class="modal hide fade"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-header" style="">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>Excluir Questão</h3>
		</div>
		<div class="modal-body">
			<p>Confirma a exclusão da questão  "<c:out value="${fn:substring(questao.enunciado,0,50)}"/>" ?</p>
		</div>
		<div class="modal-footer">
			<a href="excluirQuestao?codigo=${questao.codQuestao}" class="btn"
				style="">Sim</a> <a href="#" class="btn btn-primary"
				data-dismiss="modal" aria-hidden="true" style="">Não</a>
		</div>
	</div>

	<!-- Modal Detalhar -->
	<div id="modal_detalhar_${questao.codQuestao}" class="modal hide fade" style="display: none;"
		aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Detalhes da Questão</h3>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" style="">
				<div class="control-group">
					<label class="control-label">Enunciado</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input"><c:out value="${fn:substring(questao.enunciado,0,50)}"/> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Opção A</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input">${questao.opcaoA} </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Opção B</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input">${questao.opcaoB}
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Opção C</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input">${questao.opcaoC}
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Opção D</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input">${questao.opcaoD}
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Opção E</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input">${questao.opcaoE}
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Opção Correta</label>
					<div class="controls">
						<span class="input-xlarge uneditable-input">${questao.opcaoCorreta} </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Área de Conhecimento</label>
					<div class="controls" style="">
						<span class="input-xlarge uneditable-input">${questao.areaDeConhecimento.titulo}</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Concurso</label>
					<div class="controls" style="">
						<span class="input-xlarge uneditable-input">${questao.concurso.titulo}</span>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-primary" data-dismiss="modal"
				aria-hidden="true" style="">Fechar</a>
		</div>
	</div>
</c:forEach>


<c:import url="../rodape.jsp" />