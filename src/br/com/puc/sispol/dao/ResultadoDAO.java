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
import br.com.puc.sispol.modelo.Tarefa;

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
			stmt = this.connection.prepareStatement("	SELECT " + " * "
					+ " FROM " + "		sispol.Resposta AS r " + "		 " + " WHERE "
					+ "		CodResultado = ? " + "");
			stmt.setLong(1, resultado.getCodResultado());
			// System.out.println(stmt);
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

	public void adicionaResposta(Resposta resposta) {
		String sql = "insert into Resposta (CodQuestao, CodResultado, OpcaoEscolhida) values (?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);

			stmt.setLong(1, resposta.getQuestao().getCodQuestao());
			stmt.setLong(2, resposta.getResultado().getCodResultado());
			stmt.setString(3, resposta.getOpcaoEscolhida());

			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Resposta populaResposta(ResultSet rs) throws SQLException {
		Resposta resposta = new Resposta();
		try {
			// popula o objeto tarefa
			resposta.setCodResposta(rs.getLong("CodResposta"));
			resposta.setOpcaoEscolhida(rs.getString("OpcaoEscolhida"));

			return resposta;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void apagaRespostas(Resultado resultado) {

		String sql = "DELETE FROM sispol.Resposta WHERE CodResultado = ?";
		PreparedStatement stmt;
		ResultSet rs = null;

		try {

			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, resultado.getCodResultado());
			stmt.executeUpdate();

		} catch (SQLException e) {

			throw new RuntimeException(e);
		}
	}

	public void apura() {

		try {
			System.out.println("Apura resultados...");
			PreparedStatement stmt = this.connection
					.prepareStatement(" SELECT "
							+ "		tbResul.CodResultado,"
							+ "		COUNT(*) AS NotaDoSimulado "
							+ "	FROM "
							+ " 	sispol.Resultado tbResul "
							+ "   	INNER JOIN sispol.Resposta tbResp "
							+ "   		ON (tbResul.CodResultado = tbResp.CodResultado) "
							+ "    	INNER JOIN sispol.Questao tbQ "
							+ "       	ON (tbResp.CodQuestao = tbQ.CodQuestao) " 
							+ "		INNER JOIN sispol.Simulado tbS "
							+ "			ON (tbResul.CodSimulado = tbS.CodSimulado) "
							+ "	WHERE "
							+ "    	tbResp.OpcaoEscolhida = tbQ.OpcaoCorreta "
							+ "    	AND tbResul.NotaDoSimulado is null " 
							+ "		AND concat(curdate(), ' ' , curtime()) > DATE_ADD(TIMESTAMP(concat(tbS.DataDeRealizacao, ' ' , tbS.HoraDeRealizacao)), INTERVAL tbS.Duracao HOUR) "
							+ "	GROUP BY 1 ");
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				System.out.println("Armazena Nota Simulado em Resultado.");

				String sql = "UPDATE sispol.Resultado SET NotaDoSimulado = ? WHERE CodResultado = ?";

				stmt = connection.prepareStatement(sql);

				stmt.setLong(1, rs.getLong("NotaDoSimulado"));
				stmt.setLong(2, rs.getLong("CodResultado"));

				stmt.execute();
			}

			rs.close();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
