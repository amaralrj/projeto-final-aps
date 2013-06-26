package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.AreaDeConhecimentoQuantidade;
import br.com.puc.sispol.modelo.Questao;
import br.com.puc.sispol.modelo.Resposta;
import br.com.puc.sispol.modelo.Resultado;
import br.com.puc.sispol.modelo.Simulado;

public class ResultadoDAO {
	private final Connection connection;

	public ResultadoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// // UCS - Criar Simulado
	// public void adiciona(Simulado simulado) {
	// String sql =
	// "insert into Simulado (DataDeRealizacao, HoraDeRealizacao, Duracao, PontuacaoMinima, Titulo) values (?,?,?,?,?)";
	// PreparedStatement stmt;
	// ResultSet rs = null;
	// long codSimulado = 0;
	// try {
	//
	// stmt = connection.prepareStatement(sql,
	// Statement.RETURN_GENERATED_KEYS);
	// stmt.setDate(1, simulado.getDataDeRealizacao() != null ? new Date(
	// simulado.getDataDeRealizacao().getTimeInMillis()) : null);
	// stmt.setString(2, simulado.getHoraDeRealizacao());
	// stmt.setLong(3, simulado.getDuracao());
	// stmt.setLong(4, simulado.getPontuacaoMinima());
	// stmt.setString(5, simulado.getTitulo());
	// stmt.executeUpdate();
	// rs = stmt.getGeneratedKeys();
	// if (rs != null && rs.next()) {
	// System.out.println("Generated CodSimulado: " + rs.getInt(1));
	// codSimulado = (long) rs.getInt(1);
	//
	// }
	// } catch (SQLException e) {
	//
	// throw new RuntimeException(e);
	// }
	//
	// sql =
	// "insert into SimuladoPossuiQuestao (CodQuestao, CodSimulado) values (?,?)";
	//
	// for (Questao questao : simulado.getQuestoes()) {
	// try {
	//
	// stmt = connection.prepareStatement(sql);
	// stmt.setLong(1, questao.getCodQuestao());
	// stmt.setLong(2, codSimulado);
	// stmt.execute();
	// } catch (SQLException e) {
	// System.out.println(stmt);
	// throw new RuntimeException(e);
	// }
	// }
	//
	// }

	// // UCS - Efetuar inscrição Simulado
	// public List<Simulado> listaAguardandoInscricao() {
	//
	// try {
	// List<Simulado> simulados = new ArrayList<Simulado>();
	// PreparedStatement stmt = this.connection
	// .prepareStatement("select * from Simulado where DataDeRealizacao > current_date()");
	//
	// ResultSet rs = stmt.executeQuery();
	//
	// while (rs.next()) {
	// // adiciona a tarefa na lista
	// simulados.add(populaSimulado(rs));
	// }
	//
	// rs.close();
	// stmt.close();
	//
	// return simulados;
	// } catch (SQLException e) {
	// throw new RuntimeException(e);
	// }
	//
	// }

	private Resultado populaResultado(ResultSet rs) throws SQLException {
		Resultado resultado = new Resultado();
		try {
			// popula o objeto tarefa
			resultado.setCodResultado(rs.getLong("CodResultado"));
			resultado.setNotaDoSimulado(rs.getInt("NotaDoSimulado"));
			return resultado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	// // UCS - Efetuar inscrição Simulado
	// public void efetuaInscricao(Long codSimulado, Long codUsuario) {
	//
	// if (codSimulado == null) {
	// throw new IllegalStateException(
	// "Código do Simulado não deve ser nulo.");
	// }
	//
	// if (codUsuario == null) {
	// throw new IllegalStateException(
	// "Código do Usuário não deve ser nulo.");
	// }
	//
	// String sql =
	// "INSERT INTO Resultado (CodSimulado, CodUsuario) VALUES (?,?)";
	// PreparedStatement stmt;
	// try {
	// stmt = connection.prepareStatement(sql);
	// stmt.setLong(1, codSimulado);
	// stmt.setLong(2, codUsuario);
	// stmt.execute();
	// } catch (SQLException e) {
	// throw new RuntimeException(e);
	// }
	//
	// }

	// UCS - Realizar Simulado Inscrito
	public Resultado busca(Long codUsuario, Simulado simulado) {
		Resultado resultado = new Resultado();
		try {
			System.out.println("Consulta Resultado...");
			PreparedStatement stmt = this.connection.prepareStatement("select "
					+ "    * " + " from " + "     Resultado AS r " + " WHERE "
					+ " r.CodUsuario = ?   " + " AND r.CodSimulado = ?");
			// popula o objeto tarefa

			stmt.setLong(1, codUsuario);
			stmt.setLong(2, simulado.getCodSimulado());

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				resultado = populaResultado(rs);
			}

			System.out.println("Consulta respostas...");
			List<Resposta> respostas = new ArrayList<Resposta>();
			stmt = this.connection
					.prepareStatement("	SELECT "
							+ " * "
							+ " FROM "
							+ "		sispol.Resposta AS r "
							+ "		 "
							+ " WHERE " + "		CodResultado = ? "
							+ "");
			stmt.setLong(1, resultado.getCodResultado());
			System.out.println(stmt);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Resposta resposta = new Resposta();

				// popula o objeto resposta
				resposta.setCodResposta(rs.getLong("CodResposta"));
				resposta.setOpcaoEscolhida(rs.getString("OpcaoEscolhida"));
				
				respostas.add(resposta);
			}

			resultado.setRespostas(respostas);


			rs.close();
			stmt.close();

			return resultado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
