package tests;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import br.com.puc.sispol.ConnectionFactory;

public class TestConnectionFactory {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testGetConnection() throws SQLException {

		Connection connection = new ConnectionFactory().getConnection();
		
		assertNotNull(connection);
		connection.close();

	}

}
