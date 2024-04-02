package com.b3g1.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.b3g1.db.MySQLconnector;
import com.b3g1.db.Querys;
import com.b3g1.dto.BoardInfo;
import com.b3g1.dto.DTOClass;
import com.b3g1.dto.UserInfo;

public class Utility extends Querys{

	public static Connection conn=null;
	public Utility() {
		// TODO Auto-generated constructor stub
	}
	@SuppressWarnings("finally")
	public static ArrayList<BoardInfo> selectAll() {
		conn=MySQLconnector.connectDB();
		ArrayList<BoardInfo> boards = new ArrayList<BoardInfo>();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(querySelect);
			while (rs.next()) {
				int num = rs.getInt("NUM");
				String subject = rs.getString("SUBJECT");
				String uNickName = rs.getString("uNICKNAME");
				int hit = rs.getInt("HIT");
				String uIP = rs.getString("uIP");
				String reg_date = rs.getString("REG_DATE");
				String mod_date = rs.getString("MOD_DATE");
				String text_color = rs.getString("TEXT_COLOR");
				String text_style = rs.getString("TEXT_STYLE");
				String contents = rs.getString("CONTENTS");
				int uGrade = rs.getInt("uGRADE");
				boards.add(new BoardInfo(num, subject, uNickName, hit, uIP, reg_date, mod_date, text_color, text_style,
						contents, uGrade));
			}
		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(stmt, rs);
			close(conn);
			return boards;
		}

	}
	@SuppressWarnings("finally")
	public static ArrayList<BoardInfo> selectSubject(String SUBJECT) {
		conn=MySQLconnector.connectDB();
		ArrayList<BoardInfo> boards = new ArrayList<BoardInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(querySelectSubject);
			pstmt.setString(1, SUBJECT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("NUM");
				String subject = rs.getString("SUBJECT");
				String uNickName = rs.getString("uNICKNAME");
				int hit = rs.getInt("HIT");
				String uIP = rs.getString("uIP");
				String reg_date = rs.getString("REG_DATE");
				String mod_date = rs.getString("MOD_DATE");
				String text_color = rs.getString("TEXT_COLOR");
				String text_style = rs.getString("TEXT_STYLE");
				String contents = rs.getString("CONTENTS");
				int uGrade = rs.getInt("uGRADE");
				boards.add(new BoardInfo(num, subject, uNickName, hit, uIP, reg_date, mod_date, text_color, text_style,
						contents, uGrade));
			}
		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt, rs);
			close(conn);
			return boards;
		}

	}
	
	@SuppressWarnings("finally")
	public static ArrayList<BoardInfo> selectNickName(String uNICKNAME) {
		conn=MySQLconnector.connectDB();
		ArrayList<BoardInfo> boards = new ArrayList<BoardInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(querySelectNickName);
			pstmt.setString(1,uNICKNAME);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("NUM");
				String subject = rs.getString("SUBJECT");
				String uNickName = rs.getString("uNICKNAME");
				int hit = rs.getInt("HIT");
				String uIP = rs.getString("uIP");
				String reg_date = rs.getString("REG_DATE");
				String mod_date = rs.getString("MOD_DATE");
				String text_color = rs.getString("TEXT_COLOR");
				String text_style = rs.getString("TEXT_STYLE");
				String contents = rs.getString("CONTENTS");
				int uGrade = rs.getInt("uGRADE");
				boards.add(new BoardInfo(num, subject, uNickName, hit, uIP, reg_date, mod_date, text_color, text_style,
						contents, uGrade));
			}
		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt, rs);
			close(conn);
			return boards;
		}

	}

	public static void insertBoard(String subject, String uNickName, String text_color, String text_font,
			String contents, String uIP, String reg_date, int uGrade) {
		conn=MySQLconnector.connectDB();
		PreparedStatement pstmt = null;

		try {
			// insert into user_board
			// (SUBJECT,CONTENTS,uNICKNAME,uIP,REG_DATE,TEXT_COLOR,TEXT_STYLE,uGRADE) values
			// (?,?,?,?,?,?,?,?)

			pstmt = conn.prepareStatement(queryWrite);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setString(3, uNickName);
			pstmt.setString(4, uIP);
			pstmt.setString(5, reg_date);
			pstmt.setString(6, text_color);
			pstmt.setString(7, text_font);
			pstmt.setInt(8, uGrade);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt);
			close(conn);
		}

	}

	@SuppressWarnings("finally")
	public static BoardInfo selectDetail(int num) {
		conn=MySQLconnector.connectDB();
		BoardInfo bi = new BoardInfo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
//			SELECT * FROM user_board where NUM=?

			pstmt = conn.prepareStatement(querySelectDetail);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bi.setNum(rs.getInt("NUM"));
				bi.setSubject(rs.getString("SUBJECT"));
				bi.setuNickName(rs.getString("uNICKNAME"));
				bi.setHit(rs.getInt("HIT"));
				bi.setuIP(rs.getString("uIP"));
				bi.setReg_date(rs.getString("REG_DATE"));
				bi.setMod_date(rs.getString("MOD_DATE"));
				bi.setText_color(rs.getString("TEXT_COLOR"));
				bi.setText_style(rs.getString("TEXT_STYLE"));
				bi.setContents(rs.getString("CONTENTS"));
			}

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt, rs);
			close(conn);
			return bi;
		}

	}

	public static void updateHit(int num) {
		conn=MySQLconnector.connectDB();
		PreparedStatement pstmt = null;

		try {
//			update user_board set HIT=HIT+1 where NUM=?

			pstmt = conn.prepareStatement(queryupdateHit);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt);
			close(conn);
		}

	}

	public static void updateList(String subject, String text_color, String text_font, String contents, String mod_date,
			int num) {
		conn=MySQLconnector.connectDB();
		PreparedStatement pstmt = null;

		try {
//			update user_board set SUBJECT=?,CONTENTS=?,MOD_DATE=?,TEXT_COLOR=?,TEXT_STYLE=? where NUM=?

			pstmt = conn.prepareStatement(queryupdateList);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setString(3, mod_date);
			pstmt.setString(4, text_color);
			pstmt.setString(5, text_font);
			pstmt.setInt(6, num);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt);
			close(conn);
		}

	}

	public static void deleteList(int num) {
		conn=MySQLconnector.connectDB();
		PreparedStatement pstmt = null;

		try {
//			"delete from user_board where NUM=?";
			pstmt = conn.prepareStatement(querydelete);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(pstmt);
			close(conn);
		}

	}
	
	public static void updateAdminHit(String subject) {
		conn=MySQLconnector.connectDB();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2=null;
		int n=-1;

		try {
//			 "update hit_info set HIT=HIT+1 where TITLE=? AND HITDATE=?";
			LocalDateTime dateTime = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String formattedDate = dateTime.format(formatter);
			pstmt = conn.prepareStatement(queryupdateAdminHit);
			pstmt.setString(1, subject);
			pstmt.setString(2, formattedDate.toString());
			n=pstmt.executeUpdate();
			if(n==0) {
//				"insert into hit_info (TITLE, HITDATE, HIT) values (?,?,?)";
				pstmt2=conn.prepareStatement(queryinsertAdminHit);
				pstmt2.setString(1, subject);
				pstmt2.setString(2, formattedDate.toString());
				pstmt2.setInt(3, 1);
				pstmt2.executeUpdate();
			}

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			if(n==0) {
				close(pstmt2);
			}
			close(pstmt);
			close(conn);
		}

	}
	
	public static int insertDB(String uID,String uPW,String uNAME,String uNICKNAME,String uBIRTH,String uPW_Q,String uPW_A,String uGOAL) {

		conn=MySQLconnector.connectDB();
			String usergoal = null;
		int result = 0;
		if(uGOAL.equals("")) {
			usergoal = "0";
		}else {
			usergoal = uGOAL;
		}
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	     String dateTime = dateFormat.format(new Date());
	  
		        PreparedStatement pstmt = null;
			try {
			
				  pstmt = conn.prepareStatement(pushInfo);
//				  "INSERT INTO user (uID,uPW,uNAME,uNICKNAME,uBIRTH,uPW_Q,uPW_A,RegDate,uGOAL) " +
//		            "SELECT ?,?,?,?,?,?,?,?,? " +
//		            "WHERE NOT EXISTS (" +
	//	
//		                "FROM user " +
//		                "WHERE uID = ? " +
//		                " AND uNICKNAME = ? " +
//		            ")";
//			
				 pstmt.setString(1, uID);
				 pstmt.setString(2, uPW);
				 pstmt.setString(3, uNAME);
				 pstmt.setString(4, uNICKNAME);
				 pstmt.setString(5, uBIRTH);
				 pstmt.setString(6, uPW_Q);
				 pstmt.setString(7, uPW_A);
				 pstmt.setString(8, dateTime);
				 pstmt.setInt(9, Integer.parseInt(usergoal));
				 pstmt.setString(10, uID);
				 pstmt.setString(11, uNICKNAME);
				 
				int n = pstmt.executeUpdate();
				if(n>0) {
					result = 1;
				}
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt);
			   
			    }
				if (conn != null) {
					close(conn);
			       
			    }
			}

			return result;
		}
		///  db에 데이터 넣는부분 끝
		
		public static String IDquestion(String uNAME,String uBIRTH) {
			conn=MySQLconnector.connectDB();
			PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 String question = "";
				try {
				
					  pstmt = conn.prepareStatement(findIDQuestion);
//					  "select * from user where uBIRTH = ? AND uNAME = ?";
						pstmt.setString(1, uBIRTH);
						pstmt.setString(2, uNAME);
					  
						rs = pstmt.executeQuery();
						if(rs.next()) {
							 question = rs.getString("uPW_Q");
						}else {
							question="false";
						}
					  
				} catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (pstmt != null) {
				        close(pstmt);
				       
				    }
					if (conn != null) {
						close(conn);
				       
				    }
					
				}
			
			return question;
		}
		//아이디질문 받아오는곳 끝
		
		public static String IDanswer(String uNAME,String uBIRTH,String answers) {
			conn=MySQLconnector.connectDB();
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 String answer = "";
				try {
				
					  pstmt = conn.prepareStatement(findID);
//					 "select uID from user where uBIRTH = ? AND uNAME = ? AND uPW_A = ?";
						pstmt.setString(1, uBIRTH);
						pstmt.setString(2, uNAME);
						pstmt.setString(3, answers);
				
						rs = pstmt.executeQuery();
					
						if (rs.next()) {
				
					        answer = rs.getString("uID");
					    } else {
					        answer = "false";
					  
					    }
					  
				} catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (pstmt != null) {
				        close(pstmt);
				    }
					if (conn != null) {
						close(conn);
				       
				    }
					
				}
				return answer;
		}
//		 id찾기 id값주는부분 끝
		
		
		public static String PWquestion(String uNAME,String uID) {
			
			conn=MySQLconnector.connectDB();
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 String question = "";
				try {
				
					  pstmt = conn.prepareStatement(findPWQuestion);
//		 "select uPW_Q from user where uID = ? AND uNAME = ?";
						pstmt.setString(1, uID);
						pstmt.setString(2, uNAME);
				
						rs = pstmt.executeQuery();
					
						if (rs.next()) {
				
					       question = rs.getString("uPW_Q");
					    } else {
					        question = "false";
					  
					    }
					  
				} catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (pstmt != null) {
				        close(pstmt);
				    }
					if (conn != null) {
						close(conn);
				       
				    }
					
				}
				return question;
		}
		//비밀번호 질문생성 끝
		
		public static String PWanswer(String uNAME,String uID,String answers) {
			conn=MySQLconnector.connectDB();
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 String answer = "";
				try {
				
					  pstmt = conn.prepareStatement(findPW);
//					"select uPW from user where uID = ? AND uNAME = ? AND uPW_A = ?";
						pstmt.setString(1, uID);
						pstmt.setString(2, uNAME);
						pstmt.setString(3, answers);
				
						rs = pstmt.executeQuery();
					
						if (rs.next()) {
				
					        answer = rs.getString("uPW");
					    } else {
					        answer = "false";
					  
					    }
					  
				} catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (pstmt != null) {
				        close(pstmt);
				    }
					if (conn != null) {
						close(conn);
				       
				    }
					
				}
				return answer;
		}
		
		
		
		
		
		public static int periodUp(String uID) {
			conn=MySQLconnector.connectDB();
			 PreparedStatement pstmt = null;
			 int result = 0;
				try {
				
					  pstmt = conn.prepareStatement(periodUp);
//			"update user set uNO_PERIOD = uNO_PERIOD+1 WHERE uID= ?";
					  pstmt.setString(1, uID);
					 
						int n= pstmt.executeUpdate();
					
						if (n>0) {
					      PreparedStatement pstmt2 = conn.prepareStatement("select uNO_PERIOD from user where uID=?");
					      pstmt2.setString(1, uID);
					      ResultSet rs = pstmt2.executeQuery();
					     while(rs.next()) {
					    	 result = rs.getInt("uNO_PERIOD");
					     }
					      
					    } 
					  
				} catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (pstmt != null) {
				        close(pstmt);
				    }
					if (conn != null) {
						close(conn);
				       
				    }
					
				}
			return result;
		}
		
		//효주님꺼
		public static void myPageModifyDB(String uNICKNAME, String uBIRTH, String uPW_Q, String uPW_A,
				int uGOAL, String uID) {
			conn=MySQLconnector.connectDB();
			int n = 0;
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(QUERYSMYPAGEMODIFY);
				pstmt.setString(1, uNICKNAME);
				pstmt.setString(2, uBIRTH);
				pstmt.setString(3, uPW_Q);
				pstmt.setString(4, uPW_A);
				pstmt.setInt(5, uGOAL);
				pstmt.setString(6, uID);

				n = pstmt.executeUpdate();
				if (n > 0) {
					System.out.println(n + "개의 데이터 수정 성공");
				}
			} catch (SQLException e) {
				System.out.println("modify() ERR : " + e.getMessage());
			} finally {
				close(pstmt);
				close(conn);
			}
		}

		public static UserInfo myPageSelectDB(String uID) {
			conn=MySQLconnector.connectDB();
			PreparedStatement psmt = null;
			ResultSet rs = null;

			UserInfo userinfo = new UserInfo();

			// 쿼리 담아 실행
			try {
				psmt = conn.prepareStatement(QUERYSMYPAGESELECT);
				psmt.setString(1, uID);
				rs = psmt.executeQuery();
				while (rs.next()) {
					// 각 열값 담아 변수 셋
					userinfo.setuID(rs.getString("uID"));
					userinfo.setuPW(rs.getString("uPW"));
					userinfo.setuName(rs.getString("uName"));
					userinfo.setuNICKNAME(rs.getString("uNICKNAME"));
					userinfo.setuBIRTH(rs.getString("uBIRTH"));
					userinfo.setuPW_Q(rs.getString("uPW_Q"));
					userinfo.setuPW_A(rs.getString("uPW_A"));
					userinfo.setuGOAL(rs.getInt("uGOAL"));
					userinfo.setuNO_PERIOD(rs.getInt("uNO_PERIOD"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("select() ERR : " + e.getMessage());
			} finally {
				close(psmt,rs);
				close(conn);
			}
			return userinfo;
		}
		
		public static ArrayList<BoardInfo> myBoardSelectDB(String uNICKNAME) {
			conn=MySQLconnector.connectDB();
			PreparedStatement psmt = null;
			ResultSet rs = null;

			ArrayList <BoardInfo> boardinfo = new ArrayList<>();

			// 쿼리 담아 실행
			try {
				psmt = conn.prepareStatement(QUERYSMYWRITNGSELECT);
				psmt.setString(1, uNICKNAME);
				rs = psmt.executeQuery();
				while (rs.next()) {
					// 각 열값 담아 변수 셋
					BoardInfo board = new BoardInfo ();
					board.setSubject(rs.getString(1));
					board.setReg_date(rs.getString(2));
					board.setHit(rs.getInt(3));
					board.setuNickName(rs.getString(4));
					
					boardinfo.add(board);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("select() ERR : " + e.getMessage());
			} finally {
				close(psmt,rs);
				close(conn);
			}
			return boardinfo;
		}
		public static List<DTOClass> letterREAD(String uID){
			conn= MySQLconnector.connectDB();
			List<DTOClass> aaa = new ArrayList<DTOClass>();
			PreparedStatement pstmt = null;
			ResultSet rs= null;
			try {
			
				 pstmt = conn.prepareStatement("select * from user_letter where RECEIVER_ID= ?");
				 pstmt.setString(1, uID);
				rs = pstmt.executeQuery();
				if(rs != null) {
				while(rs.next()) {
					DTOClass abc = new DTOClass();
					abc.setRECEIVER_ID(rs.getString("RECEIVER_ID"));
					abc.setSENDER_ID(rs.getString("SENDER_ID"));
					abc.setSENDING_DATE(rs.getString("SENDING_DATE"));
					abc.setCONTENTS(rs.getString("CONTENTS"));
					abc.setUNREAD(rs.getInt("UNREAD"));
					abc.setNUM(rs.getInt("NUM"));
					aaa.add(abc);
				}
				}else {
				
				}
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt);
			    }
				if (conn != null) {
					close(conn);
			    }
				if(rs != null) {
					close(rs);
				}
			}
			
			return aaa;
		}
		//전체 쪽지 읽기 끝
		
		
		public static List<DTOClass> letterDETAIL(int NUM){
			conn= MySQLconnector.connectDB();
			List<DTOClass> bbb = new ArrayList<DTOClass>();
			PreparedStatement pstmt = null;
			ResultSet rs= null;
			try {
			
				pstmt = conn.prepareStatement("select * from user_letter where NUM=?");
				pstmt.setInt(1, NUM);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					DTOClass abc = new DTOClass();
					abc.setRECEIVER_ID(rs.getString("RECEIVER_ID"));
					abc.setSENDER_ID(rs.getString("SENDER_ID"));
					abc.setSENDING_DATE(rs.getString("SENDING_DATE"));
					abc.setCONTENTS(rs.getString("CONTENTS"));
					abc.setUNREAD(rs.getInt("UNREAD"));
					abc.setNUM(rs.getInt("NUM"));
					bbb.add(abc);
				}
				
				
				 updateREAD(NUM);
				
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt,rs);
			   
			    }
				if (conn != null) {
					close(conn);
			       
			    }
				
			}
			
			return bbb;
		}
	 ////디테일 부분 가져오기 끝
		public static int letterDELETE(int NUM){
			conn= MySQLconnector.connectDB();
		
			PreparedStatement pstmt = null;
			int result = 0;
			try {
			
				pstmt = conn.prepareStatement("delete from user_letter where NUM=?");
				pstmt.setInt(1, NUM);
				int n = pstmt.executeUpdate();
				
				if(n>0) {
					result = 1;
				}
			
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt);
			   
			    }
				if (conn != null) {
					close(conn);
			       
			    }
			}
			return result;
			
			
		}
		/// 딜리트 끝
		
		public static void updateREAD(int NUM) {
			conn= MySQLconnector.connectDB();
			PreparedStatement pstmt = null;
			
			try {
				pstmt = conn.prepareStatement("UPDATE user_letter set UNREAD = ? WHERE NUM=?");
				pstmt.setInt(1, 1);
				pstmt.setInt(2, NUM);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt);
			   
			    }
				if (conn != null) {
					close(conn);
			       
			    }
			}
		
		}
		// 업데이트 끝
		
		public static int letterWRITE(String contents,String sender,String receiver){
			conn= MySQLconnector.connectDB();
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs= null;
			 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		     String dateTime = dateFormat.format(new Date());
			try {
			
			PreparedStatement pstmt2 = conn.prepareStatement("select * from user where uNICKNAME=?");
			pstmt2.setString(1, receiver);
			 rs = pstmt2.executeQuery();
			
			if(rs.next()){

	pstmt = conn.prepareStatement("insert into user_letter (SENDER_ID,RECEIVER_ID,SENDING_DATE,UNREAD,CONTENTS) values(?,?,?,?,?)");
				pstmt.setString(1, sender);
				pstmt.setString(2, receiver);
				pstmt.setString(3, dateTime);
				pstmt.setInt(4, 0);
				pstmt.setString(5, contents);
		
				int n = pstmt.executeUpdate();
				
				if(n>0) {
					result = 1;
				}
			}
			
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt);
			   
			    }
				if (conn != null) {
					close(conn);
			       
			    }
				if (rs != null) {
					close(rs);
			       
			    }
			}
			
			return result;
		}
		//쪽지 쓰기
		public static void insertReport(String uID, String COMMENT, int BOARD_NUM) {
			conn= MySQLconnector.connectDB();
			PreparedStatement pstmt = null;
			
			try {
				pstmt = conn.prepareStatement(queryinsertReport);
				pstmt.setString(1, uID);
				pstmt.setString(2, COMMENT);
				pstmt.setInt(3,BOARD_NUM);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("SQLException ==> "+e.getMessage());
			} finally {
				if (pstmt != null) {
			        close(pstmt);
			   
			    }
				if (conn != null) {
					close(conn);
			       
			    }
			}
		
		}
		public static void menuCOUNT(String click) {
			conn=MySQLconnector.connectDB();
			 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		     String dateTime = dateFormat.format(new Date());
		     PreparedStatement pstmt2 = null;
		     PreparedStatement pstmt3 = null;
		     int result = 0;
				try {
				
					pstmt2 = conn.prepareStatement("update menu_count set COUNT=COUNT+1 where DATE=? AND MENUS=?");
						  pstmt2.setString(1, dateTime);
						  pstmt2.setString(2, click);
						  result=pstmt2.executeUpdate();
					  if(result==0) {
						 pstmt3 = conn.prepareStatement("insert into menu_count values(?,?,1)");
						  pstmt3.setString(1, dateTime);
						  pstmt3.setString(2, click);
						   pstmt3.executeUpdate();
					  }
						
					 
				} catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (pstmt2 != null) {
				        close(pstmt2);
				    }
					if (pstmt3 != null) {
				        close(pstmt3);
				    }
					if (conn != null) {
						close(conn);
				      
				    }
					
				}
			
		}
		////메뉴 누른 횟수 증가 끝
		public static void myPagePWModifyDB(String uPW, String uID) {
			conn=MySQLconnector.connectDB();
			int n = 0;
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(QUERYSMYPAGEPWMODIFY);
				pstmt.setString(1, uPW);
				pstmt.setString(2, uID);

				n = pstmt.executeUpdate();
				if (n > 0) {
					System.out.println(n + "개의 데이터 수정 성공");
				}
			} catch (SQLException e) {
				System.out.println("modifyPW() ERR : " + e.getMessage());
			} finally {
				close(pstmt);

			}
		}
		
		public static void myPageDELETEDB(String uID) {
			conn=MySQLconnector.connectDB();
			int n = 0;
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(QUERYSMYPAGEDELETE);
				pstmt.setString(1, uID);

				n = pstmt.executeUpdate();
				if (n > 0) {
					System.out.println(n + "개의 데이터 삭제 성공");
				}
			} catch (SQLException e) {
				System.out.println("DeleteUser() ERR : " + e.getMessage());
			} finally {
				close(pstmt);

			}
		}
		public static int Unread(String nick){
			conn=MySQLconnector.connectDB();
			PreparedStatement pstmt3 = null;
			ResultSet rs2= null;
			 ArrayList<Integer> abcc = new ArrayList<Integer>();
			 int result = 0;
			 try {
	            pstmt3 = conn.prepareStatement("select * from user_letter where RECEIVER_ID=? AND UNREAD=? ");
	   
	            pstmt3.setString(1, nick);
	            pstmt3.setInt(2, 0);
	          rs2 =pstmt3.executeQuery();
	            while(rs2.next()){
	            	abcc.add(0);
	            }
	            result=abcc.size();
			 }catch (SQLException e) {
					System.out.println("SQLException ==> "+e.getMessage());
				} finally {
					if (rs2 != null) {
				        close(rs2);
				    }
					if (pstmt3 != null) {
				        close(pstmt3);
				    }
					if (conn != null) {
						close(conn);
				      
				    }
				}
			return result;
		}
}
