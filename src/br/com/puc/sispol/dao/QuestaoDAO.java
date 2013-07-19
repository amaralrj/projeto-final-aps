package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.AreaDeConhecimento;
import br.com.puc.sispol.modelo.Concurso;
import br.com.puc.sispol.modelo.Questao;

public class QuestaoDAO {
	private final Connection connection;

	public QuestaoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void adiciona(Questao questao) {
		String sql = "insert into sispol.Questao(CodAreaDeConhecimento, CodConcurso, OpcaoA, OpcaoB, OpcaoC, OpcaoD, OpcaoE, OpcaoCorreta, Enunciado) values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, questao.getAreaDeConhecimento()
					.getCodAreaDeConhecimento());
			stmt.setLong(2, questao.getConcurso().getCodConcurso());
			stmt.setString(3, questao.getOpcaoA());
			stmt.setString(4, questao.getOpcaoB());
			stmt.setString(5, questao.getOpcaoC());
			stmt.setString(6, questao.getOpcaoD());
			stmt.setString(7, questao.getOpcaoE());
			stmt.setString(8, questao.getOpcaoCorreta());
			stmt.setString(9, questao.getEnunciado());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Questao> listaParaSimulado(String codAreaDeconhecimento,
			String numQuestoes) {
		try {
			List<Questao> questoes = new ArrayList<Questao>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from Questao where CodAreaDeConhecimento = ? ORDER BY RAND() LIMIT 0,? ");
			stmt.setLong(1, Integer.parseInt(codAreaDeconhecimento));
			stmt.setLong(2, Integer.parseInt(numQuestoes));
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona a tarefa na lista
				questoes.add(populaQuestao(rs));
			}

			rs.close();
			stmt.close();

			return questoes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Questao populaQuestao(ResultSet rs) throws SQLException {
		Questao questao = new Questao();

		// popula o objeto tarefa
		questao.setCodQuestao(rs.getLong("CodQuestao"));
		questao.setEnunciado(rs.getString("Enunciado"));
		questao.setOpcaoA(rs.getString("OpcaoA"));
		questao.setOpcaoB(rs.getString("OpcaoB"));
		questao.setOpcaoC(rs.getString("OpcaoC"));
		questao.setOpcaoD(rs.getString("OpcaoD"));
		questao.setOpcaoE(rs.getString("OpcaoE"));
		questao.setOpcaoCorreta(rs.getString("OpcaoCorreta"));

		return questao;
	}

	public List<Questao> buscaPorFiltro(Long codAreaDeConhecimento,
			Long codConcurso) {
		// TODO Auto-generated method stub
		try {
			List<Questao> questoes = new ArrayList<Questao>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select q.*, c.Titulo, ac.Titulo from Questao AS q INNER JOIN AreaDeConhecimento AS ac ON (q.CodAreaDeConhecimento = ac.CodAreaDeConhecimento) INNER JOIN Concurso AS c ON (q.CodConcurso = c.Codconcurso) where q.CodAreaDeConhecimento = ? AND q.CodConcurso = ? ");
			stmt.setLong(1, codAreaDeConhecimento);
			stmt.setLong(2, codConcurso);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona a tarefa na lista
				Questao questao = populaQuestao(rs);

				Concurso concurso = new Concurso();
				concurso.setCodConcurso(rs.getLong("q.CodConcurso"));
				concurso.setTitulo(rs.getString("c.Titulo"));
				questao.setConcurso(concurso);

				AreaDeConhecimento areaDeConhecimento = new AreaDeConhecimento();
				areaDeConhecimento.setCodAreaDeConhecimento(rs
						.getLong("q.CodAreaDeConhecimento"));
				areaDeConhecimento.setTitulo(rs.getString("ac.Titulo"));
				questao.setAreaDeConhecimento(areaDeConhecimento);

				questoes.add(questao);
			}

			rs.close();
			stmt.close();

			return questoes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void remove(Long codigo) {
		if (codigo == null) {
			throw new IllegalStateException(
					"Codigo da Questão não deve ser nulo.");
		}

		String sql = "delete from sispol.Questao where CodQuestao = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, codigo);
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public Questao busca(Long codigo) {
		Questao questao = null;
		// TODO Auto-generated method stub
		if (codigo == null) {
			throw new IllegalStateException(
					"Codigo da questao não deve ser nulo.");
		}
		try {

			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT q.*, c.Titulo, ac.Titulo from Questao AS q INNER JOIN AreaDeConhecimento AS ac ON (q.CodAreaDeConhecimento = ac.CodAreaDeConhecimento) INNER JOIN Concurso AS c ON (q.CodConcurso = c.Codconcurso) WHERE q.CodQuestao = ?");
			stmt.setLong(1, codigo);
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona a tarefa na lista
				questao = populaQuestao(rs);

				Concurso concurso = new Concurso();
				concurso.setCodConcurso(rs.getLong("q.CodConcurso"));
				concurso.setTitulo(rs.getString("c.Titulo"));
				questao.setConcurso(concurso);

				AreaDeConhecimento areaDeConhecimento = new AreaDeConhecimento();
				areaDeConhecimento.setCodAreaDeConhecimento(rs
						.getLong("q.CodAreaDeConhecimento"));
				areaDeConhecimento.setTitulo(rs.getString("ac.Titulo"));
				questao.setAreaDeConhecimento(areaDeConhecimento);
			}

			rs.close();
			stmt.close();

			return questao;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void altera(Questao questao) {
		String sql = "update sispol.Questao set Enunciado = ?, OpcaoA = ?, OpcaoB = ?, OpcaoC = ?, OpcaoD = ?, OpcaoE = ?, OpcaoCorreta = ?, CodConcurso = ?, CodAreaDeConhecimento = ? where CodQuestao = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, questao.getEnunciado());
			stmt.setString(2, questao.getOpcaoA());
			stmt.setString(3, questao.getOpcaoB());
			stmt.setString(4, questao.getOpcaoC());
			stmt.setString(5, questao.getOpcaoD());
			stmt.setString(6, questao.getOpcaoE());
			stmt.setString(7, questao.getOpcaoCorreta());
			stmt.setLong(8, questao.getConcurso().getCodConcurso());
			stmt.setLong(9, questao.getAreaDeConhecimento().getCodAreaDeConhecimento());
			stmt.setLong(10, questao.getCodQuestao());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
