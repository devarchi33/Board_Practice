package board.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import board.info.User;

public class UserDao {
	static Logger logger = LoggerFactory.getLogger(UserDao.class);
	private static UserDao userDao;
	User user = null;

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	final String DATASOURCE = "java:comp/env/jdbc/OracleDB";

	String sql = "SELECT * FROM scott.MEMBER3 WHERE scott.MEMBER3.\"id\"=? AND scott.MEMBER3.\"pass\"=?";

	public static UserDao getInstance() {
		if (userDao == null) {
			userDao = new UserDao();
		}

		return userDao;
	}

	public User login(String id, String pass) throws SQLException,
			NullPointerException, NamingException {

		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup(DATASOURCE);
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();

			logger.debug("rs0 : " + rs);

			if (rs.next()) {
				user = new User();
				user.setId(rs.getString("id"));
				user.setPass(rs.getString("pass"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setEdu(rs.getString("edu"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.getMessage();
		} catch (NamingException e) {
			e.getMessage();
		} finally {
			logger.debug("DAO ID : " + id);
			logger.debug("DAO PASS : " + pass);
			logger.debug("rs1 : " + rs);
			logger.debug("user.getId() : " +user.getId());
			rs.close();
			pstmt.close();
			conn.close();
			logger.debug("rs2 : " + rs);
		}

		return user;
	}
}
