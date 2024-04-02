package com.b3g1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class Querys {
	public static final String driver = "com.mysql.cj.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/db_b3g1?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	public static final String id_mysql = "root";
	public static final String pw_mysql = "1234"; // 본인 비밀번호
	public static final String querySelect = "SELECT * FROM user_board ORDER BY NUM DESC";
	public static final String queryWrite = "insert into user_board (SUBJECT,CONTENTS,uNICKNAME,uIP,REG_DATE,TEXT_COLOR,TEXT_STYLE,uGRADE) values (?,?,?,?,?,?,?,?)";
	public static final String querySelectDetail = "SELECT * FROM user_board where NUM=?";
	public static final String queryupdateHit = "update user_board set HIT=HIT+1 where NUM=?";
	public static final String queryupdateList = "update user_board set SUBJECT=?,CONTENTS=?,MOD_DATE=?,TEXT_COLOR=?,TEXT_STYLE=? where NUM=?";
	public static final String querydelete = "delete from user_board where NUM=?";
	public static final String querySelectNickName = "SELECT * FROM user_board where uNICKNAME like CONCAT('%',?,'%') ORDER BY NUM DESC";
	public static final String querySelectSubject = "SELECT * FROM user_board where SUBJECT like CONCAT('%',?,'%') ORDER BY NUM DESC";
	public static final String queryupdateAdminHit = "update hit_info set HIT=HIT+1 where TITLE=? AND HITDATE=?";
	public static final String queryinsertAdminHit = "insert into hit_info (TITLE, HITDATE, HIT) values (?,?,?)";
	public static final String queryinsertReport = "insert into report_info (uID, COMMENT, BOARD_NUM) values (?,?,?)";
	
	public static final String pushInfo = "INSERT INTO user (uID,uPW,uNAME,uNICKNAME,uBIRTH,uPW_Q,uPW_A,RegDate,uGOAL) " +
		    "SELECT ?,?,?,?,?,?,?,?,? " +
		    "FROM dual " +
		    "WHERE NOT EXISTS (" +
		        "SELECT 1 " +
		        "FROM user " +
		        "WHERE uID = ? " +
		        "OR uNICKNAME = ? " +
		    ")";
	
	public static final String loginC = "SELECT * FROM user WHERE uID=? AND uPW=?";
	public static final String findIDQuestion = "select uPW_Q from user where uBIRTH = ? AND uNAME = ?";
	public static final String findID = "select uID from user where uBIRTH = ? AND uNAME = ? AND uPW_A = ?";
	public static final String findPWQuestion = "select uPW_Q from user where uID = ? AND uNAME = ?";
	public static final String findPW = "select uPW from user where uID = ? AND uNAME = ? AND uPW_A = ?";
	public static final String periodUp = "update user set uNO_PERIOD = uNO_PERIOD+1 WHERE uID= ?";
	
	public static final String QUERYSMYPAGEMODIFY="update user set uNICKNAME=?, uBIRTH=?, uPW_Q=?, uPW_A=?, uGOAL=? where uID=?";
	public static final String QUERYSMYWRITNGSELECT="select SUBJECT, REG_DATE, HIT, uNICKNAME from user_board where uNICKNAME=?";
	public static final String QUERYSMYPAGESELECT = "select * from user where uid = ?";
	 public static final String QUERYSMYPAGEPWMODIFY = "update user set uPW=? where uID=?";
	 public static final String QUERYSMYPAGEDELETE = "delete from user where uID=?";
	 
	public Querys() {
		// TODO Auto-generated constructor stub
	}

	public static void close(PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("close() ERR: " + e.getMessage());
		}
	}

	public static void close(Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println("close() ERR: " + e.getMessage());
		}
	}

	public static void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("close() ERR: " + e.getMessage());
		}
	}
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			System.out.println("close() ERR: " + e.getMessage());
		}
	}

	public static void close(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("close() ERR: " + e.getMessage());
		}
	}
}
