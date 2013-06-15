package br.com.puc.sispol.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import br.com.puc.sispol.ConnectionFactory;
import br.com.puc.sispol.modelo.Questao;
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
		ResultSet rs = null;
		long codSimulado = 0;
		try {

			stmt = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			stmt.setDate(1, simulado.getDataDeRealizacao() != null ? new Date(
					simulado.getDataDeRealizacao().getTimeInMillis()) : null);
			stmt.setString(2, simulado.getHoraDeRealizacao());
			stmt.setLong(3, simulado.getDuracao());
			stmt.setLong(4, simulado.getPontuacaoMinima());
			stmt.setString(5, simulado.getTitulo());
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
            if(rs != null && rs.next()){
                System.out.println("Generated CodSimulado: "+rs.getInt(1));
                codSimulado = (long)rs.getInt(1);
                
            }
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
		}
		
		
		sql = "insert into SimuladoPossuiQuestao (CodQuestao, CodSimulado) values (?,?)";
		
		for(Questao questao: simulado.getQuestoes()){
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



}
