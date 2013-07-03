<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />
 <div class="container-fluid" >
        <div class="row-fluid" >
          <div class="pull-left span1" >
            <ul class="nav  nav-pills nav-stacked" ></ul>
          </div>
          <div class="pull-left span7" >
            <div class="row-fluid" >
              <div class="span4" >
                <p></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row" >
      <div class="span1" >
        <a> </a> 
      </div>
      <div class="span11" >
        <ol class="breadcrumb" >
          <li>
            <a href="home.html" ><i class="icon-home" ></i> Home</a>
            <span class="divider" >/</span> 
          </li>
          <li class="active" >Classificação Simulado Oficial</li>
        </ol>
    <table class="table table-hover table-bordered table-condensed table-striped" >
        <caption>
          <b><h4 class="pull-left" >Classificação do Simulado para Banco do Brasil-Tecnico Administrativo (20/10/2012)</h4></b> 
        </caption>
        <thead>
          <tr>
            <th>Nome do Usuário</th>
            <th>Pontuação</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Anderson Santos</td>
            <td>40</td>
          </tr>
          <tr>
            <td>Pedro Amaral</td>
            <td>35</td>
          </tr>
          <tr>
            <td>Bruno Ronzani</td>
            <td>20</td>
          </tr>
          <tr>
            <td>Juan Capobianco</td>
            <td>20</td>
          </tr>
        </tbody>
      </table>   
      </div>
    </div>
<c:import url="../rodape.jsp" />