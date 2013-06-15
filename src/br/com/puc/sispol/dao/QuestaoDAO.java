package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.Questao;
import br.com.puc.sispol.modelo.Tarefa;

public class QuestaoDAO {
	private final Connection connection;

	public QuestaoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
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
		questao.setCodAreaDeConhecimento(rs.getLong("CodAreaDeConhecimento"));
		questao.setCodQuestao(rs.getLong("CodQuestao"));

		return questao;
	}

}
