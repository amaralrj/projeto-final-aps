<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../cabecalho.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="resources/js/jquery.countdown.js"></script>
<script type="text/javascript">
		var dataDeRealizacao = '<fmt:formatDate value="${simulado.dataDeRealizacao.time}" pattern="dd/MM/yyyy" />';
		var arraydataDeRealizacao = dataDeRealizacao.split('/');
		//alert('Ano: '+arraydataDeRealizacao[2]);
		//alert('Mês: '+arraydataDeRealizacao[1]);
		//alert('Dia: '+arraydataDeRealizacao[0]);
		var horaDeRealizacao = '${simulado.horaDeRealizacao}';
		var arrayhoraDeRealizacao = horaDeRealizacao.split(':');
		//alert('Hora: '+arrayhoraDeRealizacao[0]);
		//alert('Minuto: '+arrayhoraDeRealizacao[1]);

		$(function() {
			$('#cronometro').countdown(
					{

						since : new Date(arraydataDeRealizacao[2],
								arraydataDeRealizacao[1] - 1,
								arraydataDeRealizacao[0],
								arrayhoraDeRealizacao[0],
								arrayhoraDeRealizacao[1]),
						compact : true
					});
		});
	</script>
</head>
<body>
	<c:import url="../menu.jsp" />
	<div class="container-fluid">
		<span class="label label-info pull-right"><i
			class="icon-search icon-time"></i> Tempo decorrido:&nbsp;
			<div id="cronometro" style="float: right"></div></span>
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
				<li><a href="ar	 ea_usuario.html"> Área do Usuário</a> <span
					class="divider">/</span></li>
				<li class="active">Realizar Simulado Previamente Inscrito</li>
			</ol>
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
					<td><c:forEach items="${areasDeConhecimento}"
							var="areaDeConhecimento" varStatus="loop">
            			${areaDeConhecimento.titulo} 
            			<c:if test="${!loop.last}"> / </c:if>
						</c:forEach>
				</tr>
				<c:forEach items="${areasDeConhecimento}" var="areaDeConhecimento">
					<tr>
						<td><b>${areaDeConhecimento.titulo}</b></td>
						<td>${areaDeConhecimento.quantidade} questões</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
			<table style="width: 857px; height: 11px;">
				<caption>
					<b><h4 class="pull-left">Questões</h4></b>
				</caption>
				<tbody>
					<c:forEach items="${questoes}" var="questao" varStatus="rowCounter">
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
							<td><label class="radio"> <span
									class="badge badge-info">A</span> <input type="radio"
									name="questao[]" id="questao[]" value="A"
									checked="" /> ${questao.opcaoA}
							</label></td>
						</tr>
						<tr>
							<td><label class="radio"> <span
									class="badge badge-info">B</span> <input type="radio"
									name="questao[]" id="questao[]" value="B" />${questao.opcaoB}
							</label></td>
						</tr>
						<tr>
							<td><label class="radio"> <span
									class="badge badge-info">C</span> <input type="radio"
									name="questao[]" id="questao[]" value="C" />
									${questao.opcaoC}
							</label></td>
						</tr>
						<tr>
							<td><label class="radio"> <span
									class="badge badge-info">D</span> <input type="radio"
									name="questao[]" id="questao[]" value="D" />
									${questao.opcaoD}
							</label></td>
						</tr>
						<tr>
							<td><label class="radio"> <span
									class="badge badge-info">E</span> <input type="radio"
									name="questao[]" id="questao[]" value="E" />
									${questao.opcaoE}
							</label></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</c:forEach>
					<tr>
						<td><br>
							<button class="btn" type="button">Encerrar Simulado</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<c:import url="../rodape.jsp" />