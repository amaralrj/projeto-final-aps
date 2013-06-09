package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.AreaDeConhecimento;
import br.com.puc.sispol.modelo.Tarefa;

public class AreaDeConhecimentoDAO {
	private final Connection connection;

	public AreaDeConhecimentoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void adiciona(AreaDeConhecimento areaDeConhecimento) {
		String sql = "insert into AreaDeConhecimento (Titulo, Descricao) values (?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, areaDeConhecimento.getTitulo());
			stmt.setString(2, areaDeConhecimento.getDescricao());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}




}
