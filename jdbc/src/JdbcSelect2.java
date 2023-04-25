package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.Scanner;

public class JdbcSelect2 {

	public static void main(String[] args) {

		/*
		 *  사용자에게 Scanner를 이용하여 job_id를 입력 받습니다.
		 *  입력받은 job_id에 해당하는 사람들의 first_name, salary를
		 *  콘솔창에 출력해 주세요. (employees 테이블 사용.)
		 *  조회된 내용이 없다면 조회 결과가 없다고 출력해 주세요.
		 */
		
		Scanner sc = new Scanner(System.in);
		
//		System.out.println("id를 입력해 주세요.");
//		String id = sc.next();
		System.out.println("job_id를 입력해 주세요.");
		String jid = sc.next();
		
		String sql = "SELECT * FROM employees WHERE job_id = ?";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "hr";
		String upw = "hr";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jid);
			
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				System.out.println("아이디가 없습니다");
			} 
			
			while(rs.next()) {
				
//				String id = rs.getString("job_id"); //괄호 안에 컬럼명
//				String pw = rs.getString("mem_pw"); 
				String name = rs.getString("first_name"); 
				int salary = rs.getInt("salary");
				
//				LocalDateTime regDate= rs.getTimestamp("mem_regdate").toLocalDateTime();
				
				System.out.printf("# 이름: %s\n# 급여: %d$\n", name, salary);
				System.out.println("------------------------");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				rs.close();
				pstmt.close();
				conn.close();
				sc.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
		}
		
	}

}
