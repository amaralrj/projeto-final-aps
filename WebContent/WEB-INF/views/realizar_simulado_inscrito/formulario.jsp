<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="../cabecalho.jsp" />
</head>
<body>
	<c:import url="../menu.jsp" />
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



	<div class="container-fluid">
		<span class="label label-info pull-right"><i
			class="icon-search icon-time"></i> Tempo decorrido:&nbsp;<div id="cronometro" style="float:right"></div></span>
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
					<tr>
						<td><b>Questão 1:</b>
							<p></p></td>
					</tr>
					<tr>
						<td>O conceito de Suíte de Plataforma de Aplicação
							(Application Platform Suite - APS) está relacionado à integração
							de aplicações. O Java CAPS é a solução de APS para Java e possui
							componentes de tempo de projeto (design) e de tempo de execução
							(run-time). O Java CAPS oferece diversas potencialidades, EXCETO:
							<p></p>
						</td>
					</tr>
					<tr>
						<td><label class="radio"> <span
								class="badge badge-info">A</span> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="option1"
								checked="" /> disponibilizar um ambiente de desenvolvimento
								integrado que realiza o monitoramento e o gerenciamento do
								ambiente de execução.
						</label></td>
					</tr>
					<tr>
						<td><label class="radio"> <span
								class="badge badge-info">B</span> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="option1" />
								possuir o componente logicalhost, responsável pela hospedagem
								das aplicações nele implantadas.
						</label></td>
					</tr>
					<tr>
						<td><label class="radio"> <span
								class="badge badge-info">C</span> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="option1" />
								possuir um repositório que armazena os artefatos produzidos a
								tempo de projeto e que fornece um sistema de controle de
								versões.
						</label></td>
					</tr>
					<tr>
						<td><label class="radio"> <span
								class="badge badge-info">D</span> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="option1" />
								propiciar a integração de sistemas legados (legacy systems)
								através de adaptadores (adapters).
						</label></td>
					</tr>
					<tr>
						<td><label class="radio"> <span
								class="badge badge-info">E</span> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="option1" />
								prover suporte à utilização de diversos servidores de aplicação,
								cada um dos quais representando um contêiner Java EE.
						</label></td>
					</tr>
					<tr>
						<td><br>
							<button class="btn" type="button">Encerrar Simulado</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<c:import url="../rodape.jsp" />