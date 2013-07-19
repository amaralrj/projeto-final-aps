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

public class ConcursoDAO {
	private final Connection connection;

	public ConcursoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Concurso> lista() {
		try {
			List<Concurso> concursos = new ArrayList<Concurso>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select CodConcurso, Titulo from sispol.Concurso");
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona a tarefa na lista
				concursos.add(populaConcurso(rs));
			}

			rs.close();
			stmt.close();

			return concursos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Concurso populaConcurso(ResultSet rs) throws SQLException {
		Concurso concurso = new Concurso();

		// popula o objeto areaDeConhecimento

		concurso.setCodConcurso(rs.getLong("CodConcurso"));
		concurso.setTitulo(rs.getString("Titulo"));
		return concurso;
	}

}
