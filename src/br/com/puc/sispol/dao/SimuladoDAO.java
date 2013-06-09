package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.Simulado;

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
		try {
			
			stmt = connection.prepareStatement(sql);
			stmt.setDate(1, simulado.getDataDeRealizacao() != null ? new Date(simulado.getDataDeRealizacao().getTimeInMillis()) : null);
			stmt.setString(2, simulado.getHoraDeRealizacao());
			stmt.setLong(3, simulado.getDuracao());
			stmt.setLong(4, simulado.getPontuacaoMinima());
			stmt.setString(5, simulado.getTitulo());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}




}
