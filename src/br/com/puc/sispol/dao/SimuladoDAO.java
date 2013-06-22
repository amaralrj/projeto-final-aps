package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.AreaDeConhecimentoQuantidade;
import br.com.puc.sispol.modelo.Questao;
import br.com.puc.sispol.modelo.Simulado;
import br.com.puc.sispol.modelo.Tarefa;

public class SimuladoDAO {
	private final Connection connection;

	public SimuladoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void adiciona(Simulado simulado) {
		String sql = "insert into Simulado (DataDeRealizacao, HoraDeRealizacao, Duracao, PontuacaoMinima, Titulo) values (?,?,?,?,?)";
		PreparedStatement stmt;
		ResultSet rs = null;
		long codSimulado = 0;
		try {

			stmt = connection.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);
			stmt.setDate(1, simulado.getDataDeRealizacao() != null ? new Date(
					simulado.getDataDeRealizacao().getTimeInMillis()) : null);
			stmt.setString(2, simulado.getHoraDeRealizacao());
			stmt.setLong(3, simulado.getDuracao());
			stmt.setLong(4, simulado.getPontuacaoMinima());
			stmt.setString(5, simulado.getTitulo());
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			if (rs != null && rs.next()) {
				System.out.println("Generated CodSimulado: " + rs.getInt(1));
				codSimulado = (long) rs.getInt(1);

			}
		} catch (SQLException e) {

			throw new RuntimeException(e);
		}

		sql = "insert into SimuladoPossuiQuestao (CodQuestao, CodSimulado) values (?,?)";

		for (Questao questao : simulado.getQuestoes()) {
			try {

				stmt = connection.prepareStatement(sql);
				stmt.setLong(1, questao.getCodQuestao());
				stmt.setLong(2, codSimulado);
				stmt.execute();
			} catch (SQLException e) {
				System.out.println(stmt);
				throw new RuntimeException(e);
			}
		}

	}

	public List<Simulado> listaAguardandoInscricao() {

		try {
			List<Simulado> simulados = new ArrayList<Simulado>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from Simulado where DataDeRealizacao > current_date()");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona a tarefa na lista
				simulados.add(populaSimulado(rs));
			}

			rs.close();
			stmt.close();

			return simulados;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	private Simulado populaSimulado(ResultSet rs) throws SQLException {
		Simulado simulado = new Simulado();

		// popula o objeto tarefa
		simulado.setCodSimulado(rs.getLong("CodSimulado"));
		simulado.setTitulo(rs.getString("Titulo"));
		simulado.setHoraDeRealizacao(rs.getString("HoraDeRealizacao"));
		simulado.setDuracao(rs.getInt("Duracao"));
		simulado.setPontuacaoMinima(rs.getInt("PontuacaoMinima"));

		// popula a data de finalizacao da tarefa, fazendo a conversao
		Date data = rs.getDate("DataDeRealizacao");
		if (data != null) {
			Calendar dataDeRealizacao = Calendar.getInstance();
			dataDeRealizacao.setTime(data);
			simulado.setDataDeRealizacao(dataDeRealizacao);
		}
		return simulado;
	}

	public void efetuaInscricao(Long codSimulado, Long codUsuario) {

		if (codSimulado == null) {
			throw new IllegalStateException(
					"Código do Simulado não deve ser nulo.");
		}

		if (codUsuario == null) {
			throw new IllegalStateException(
					"Código do Usuário não deve ser nulo.");
		}

		String sql = "INSERT INTO Resultado (CodSimulado, CodUsuario) VALUES (?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, codSimulado);
			stmt.setLong(2, codUsuario);
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public Simulado buscaSimuladoASerRealizado(Long codUsuario) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select "
							+ "    *"
							+ " from "
							+ "     Simulado AS s"
							+ "     INNER JOIN Resultado AS r"
							+ "        ON (s.CodSimulado = r.CodSimulado)"
							+ " WHERE"
							+ "    concat(curdate(), ' ' , curtime())"
							+ "        BETWEEN "
							+ "            TIMESTAMP(concat(s.DataDeRealizacao, ' ' , s.HoraDeRealizacao))"
							+ "            AND DATE_ADD(TIMESTAMP(concat(s.DataDeRealizacao, ' ' , s.HoraDeRealizacao)), INTERVAL Duracao HOUR)"
							+ "    AND r.CodUsuario = ?" + "  LIMIT 0,1");
			stmt.setLong(1, codUsuario);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return populaSimulado(rs);
			}

			rs.close();
			stmt.close();

			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<AreaDeConhecimentoQuantidade> buscaAreasDeConhecimentoDoSimulado(Simulado simulado) {

		try {
			List<AreaDeConhecimentoQuantidade> areasDeConhecimentoQuantidade = new ArrayList<AreaDeConhecimentoQuantidade>();
			PreparedStatement stmt = this.connection.prepareStatement("	SELECT "
					+ " a.Titulo, count(*) AS total " 
					+ " FROM "
					+ "		sispol.SimuladoPossuiQuestao AS s "
					+ "		INNER JOIN sispol.Questao AS q "
					+ "			ON (s.CodQuestao = q.CodQuestao) "
					+ "		INNER JOIN sispol.AreaDeConhecimento AS a "
					+ "			ON (q.CodAreaDeConhecimento = a.CodAreaDeConhecimento) "
					+ " WHERE " 
					+ "		CodSimulado = ? "
					+ " GROUP BY a.Titulo ORDER BY a.Titulo");
			stmt.setLong(1, simulado.getCodSimulado());
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				AreaDeConhecimentoQuantidade areaDeConhecimentoQuantidade = new AreaDeConhecimentoQuantidade();
				System.out.println("quantas vezes?");
				// popula o objeto tarefa
				areaDeConhecimentoQuantidade.setTitulo(rs.getString("Titulo"));
				areaDeConhecimentoQuantidade.setQuantidade(rs.getInt("total"));
				areasDeConhecimentoQuantidade.add(areaDeConhecimentoQuantidade);
			}
			
			rs.close();
			stmt.close();
			return areasDeConhecimentoQuantidade;
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
