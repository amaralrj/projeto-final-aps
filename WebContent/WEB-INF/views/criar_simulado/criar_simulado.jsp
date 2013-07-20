<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />

<script type="text/javascript">
	var options = "";
	<c:forEach items="${areasDeConhecimento}" var="areaDeConhecimento">
	options += '<option value="${areaDeConhecimento.codAreaDeConhecimento}">${areaDeConhecimento.titulo}</option>';
	</c:forEach>

	$('#mais')
			.live(
					'click',
					function() {

						//recuperando o próximo numero da linha
						var next = $('#questoes').children('div').length;

						fields = '<div id="questao_' + next + '" class="control-group">'
								+ '<label class="control-label">*Área de Conhecimento</label>'
								+ '<div class="controls controls-row">'
								+ '<select id="areaDeConhecimento[' + next + ']" name="areaDeConhecimento[' + next + ']" class="input-xlarge span2" >'
								+ options
								+ '</select> '
								+ '<label class="span1 control-label">*Número de Questões</label> '
								+ '<input class="span2" type="text" name="numQuestoes[' + next + ']" placeholder="Núm. de Questões" />'
								+ '</div>' + '</div>';

						$('#questoes').append(fields);
						//next = $('#questoes').children('div').length;
						//armazenando a quantidade de linhas ou registros no elemento hidden
						//$(':hidden').val(next);

						return false;
					});

	$('#remove').live('click', function() {
		//recuperando o próximo numero da linha
		var next = $('#questoes').children('div').length - 1;
		$('#questao_' + next).remove();
		$(':hidden').val(next);
		return false;
	});
</script>
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
			<li><a href="#"><i class="icon-home"></i> Home</a> <span
				class="divider">/</span></li>
			<li><a href="#">Área de Administração</a> <span class="divider">/</span></li>
			<li class="active">Criar Simulado</li>
		</ol>
		<form:errors path="*" />
		<form class="form-signin form-horizontal" action="adicionaSimulado"
			method="post">
			<fieldset>
				<legend>Criar Simulado</legend>
				<c:if test="${sucesso eq 1}">
					<div class="alert alert-success">Cadastro realizado com
						sucesso!</div>
				</c:if>
				<div class="control-group">
					<label class="control-label">*Título</label>
					<div class="controls">
						<input id="titulo" name="titulo" type="text"
							placeholder="Título do Simulado" class="input-xlarge" value="" />
						<form:errors path="simulado.titulo" class="text-error" />
					</div>
				</div>
				<div id="questoes">
					<!-- Text input-->
					<div class="control-group">
						<label class="control-label">*Área de Conhecimento</label>
						<div class="controls controls-row">
							<select id="areaDeConhecimento[0]" name="areaDeConhecimento[0]"
								class="input-xlarge span2">
								<c:forEach items="${areasDeConhecimento}"
									var="areaDeConhecimento">
									<option value="${areaDeConhecimento.codAreaDeConhecimento}">${areaDeConhecimento.titulo}</option>
								</c:forEach>
							</select> 
							<label class="span1 control-label">*Número de Questões</label> <input
								class="input-slarge span2" name="numQuestoes[0]" type="text"
								placeholder="Núm. de Questões" />
							<c:if test="${erroNumQuestoes_0 eq 1}">
								<span class="text-error">O Número de Questões deve ser
									preenchido.</span>
							</c:if>
						</div>
					</div>
				</div>
				<div class="control-group">

					<a class="btn btn-small" id="mais"><i class="icon-plus"></i></a> <a
						id="remove" class="btn btn-small"> <i class="icon-minus"></i>
					</a>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Data de Realização</label>
					<div class="controls">
						<input id="dataDeRealizacao" name="dataDeRealizacao" type="text"
							placeholder="Data de realização do Simulado" class="input-xlarge"
							value="" />
						<form:errors path="simulado.dataDeRealizacao" class="text-error" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">*Hora de Realização</label>
					<div class="controls">
						<input id="horaDeRealizacao" name="horaDeRealizacao" type="text"
							placeholder="Hora de realização do Simulado" class="input-xlarge"
							value="" />
						<form:errors path="simulado.horaDeRealizacao" class="text-error" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">*Duração</label>
					<div class="controls">
						<input id="duracao" name="duracao" type="text"
							placeholder="Duração do Simulado" class="input-xlarge" value="" />
						<form:errors path="simulado.duracao" class="text-error" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">*Pontuação Mínima</label>
					<div class="controls">
						<input id="pontuacaoMinima" name="pontuacaoMinima" type="text"
							placeholder="Pontuação Mínima." value="" />
						<form:errors path="simulado.pontuacaoMinima" class="text-error" />
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