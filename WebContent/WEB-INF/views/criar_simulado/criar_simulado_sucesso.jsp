<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:import url="../cabecalho.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<legend>Criar Simulado</legend>
		<div class="alert alert-success">Simulado criado com sucesso!</div>
		<table class="table table-bordered table-condensed table-striped">
			<tbody>
			<caption>
				<b><h4 class="pull-left">Detalhes do Simulado</h4></b>
			</caption>
			<tr>
				<td><b>Título:</b></td>
				<td>${simulado.titulo}</td>
			</tr>
			<tr>
				<td><b>Data de Realização:</b></td>
				<td><fmt:formatDate value="${simulado.dataDeRealizacao.time}"
						pattern="dd/MM/yyyy" /></td>
			</tr>
			<tr>
				<td><b>Hora de Realização:</b></td>
				<td>${simulado.horaDeRealizacao}</td>
			</tr>
			<tr>
				<td><b>Duração:</b></td>
				<td>${simulado.duracao}h</td>
			</tr>
			<tr>
				<td><b>Pontuação Mínima:</b></td>
				<td>${simulado.pontuacaoMinima}</td>
			</tr>
			<tr>
				<td><b>Áreas de Conhecimento:</b></td>
				<td><c:forEach items="${simulado.areasDeConhecimentoQuantidade}" var="areaDeConhecimento"
					varStatus="rowCounter">${areaDeConhecimento.titulo} 
					<c:if test="${!rowCounter.last}"> / </c:if>
					</c:forEach>
					</td>
			</tr>
			<c:forEach items="${simulado.areasDeConhecimentoQuantidade}" var="areaDeConhecimento"
					varStatus="rowCounter">
			<tr>
				<td><b>${areaDeConhecimento.titulo}</b></td>
				<td>${areaDeConhecimento.quantidade}</td>
			</tr>
			</c:forEach>
			
			</tbody>
		</table>
		<table style="width: 857px; height: 11px;">
			<caption>
				<b><h4 class="pull-left">Questões</h4></b>
			</caption>
			<tbody>
				<c:forEach items="${simulado.questoes}" var="questao"
					varStatus="rowCounter">
					<tr>
						<td><b>Questão ${rowCounter.count}:</b>
							<p></p></td>
					</tr>
					<tr>
						<td>${questao.enunciado}
							<p></p>
						</td>
					</tr>
					<tr>
						<td><label> <span class="badge badge-<c:choose><c:when test="${questao.opcaoCorreta == 'A'}">important</c:when><c:otherwise>info</c:otherwise></c:choose>">A</span>
								${questao.opcaoA}
						</label></td>
					</tr>
					<tr>
						<td><label> <span class="badge badge-<c:choose><c:when test="${questao.opcaoCorreta == 'B'}">important</c:when><c:otherwise>info</c:otherwise></c:choose>">B</span>
								${questao.opcaoB}
						</label></td>
					</tr>
					<tr>
						<td><label> <span class="badge badge-<c:choose><c:when test="${questao.opcaoCorreta == 'C'}">important</c:when><c:otherwise>info</c:otherwise></c:choose>">C</span>
								${questao.opcaoC}
						</label></td>
					</tr>
					<tr>
						<td><label> <span class="badge badge-<c:choose><c:when test="${questao.opcaoCorreta == 'D'}">important</c:when><c:otherwise>info</c:otherwise></c:choose>">D</span>
								${questao.opcaoD}
						</label></td>
					</tr>
					<tr>
						<td><label> <span class="badge badge-<c:choose><c:when test="${questao.opcaoCorreta == 'E'}">important</c:when><c:otherwise>info</c:otherwise></c:choose>">E</span>
								${questao.opcaoE}
						</label></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<c:import url="../rodape.jsp" />