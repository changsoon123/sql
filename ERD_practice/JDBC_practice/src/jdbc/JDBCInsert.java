package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCInsert {

	public static void main(String[] args) {
		//C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
		// 폴더를 클릭해서 properties를 눌러서
		// java build path에서 classpath에서
		// 복사한 주소에 있는 ojdbc6를 열어서 생성
		
		Scanner sc = new Scanner(System.in);
		
			
		System.out.println("*** 회원 가입 페이지 ***");
		
		System.out.println("아이디: ");
		String id = sc.next();
		
		System.out.println("비밀번호: ");
		String pw = sc.next();
		
		System.out.println("이름: ");
		String name = sc.next();
		
		System.out.println("나이: ");
		int age = sc.nextInt();
		
		/////////////////////////////////
		//sql 테이블 생성문 SQL DEVELOPER에다 입력
//		CREATE TABLE members(
//			    mem_id VARCHAR2(20) PRIMARY KEY,
//			    mem_pw VARCHAR2(20) NOT NULL,
//			    mem_name VARCHAR2(20) NOT NULL,
//			    mem_age NUMBER(2),
//			    mem_regdate DATE DEFAULT sysdate
//			);
		
		//SQL문 작성
		//SQL 문은 String 형태로 작성한다.
		//변수가 들어갈 자리에 ?를 채운다.
		
		String sql = "INSERT INTO members" 
		+ "(mem_id, mem_pw, mem_name, mem_age)"
		+ "VALUES(?,?,?,?)";
		
		//DB 연동 순서
		//1. DB 사용자 계정명, 암호, DB url 등 초기 데이터 변수를 설정.
		String url = "jdbc:oracle:thin://localhost:1521:xe"; 
		//oracle localhost:(포트번호)1521 서비스 아이디:xe 
		String uid = "hr";
		String upw = "hr";
		
		//2.JDBC 커넥터 드라이버 호출
		// Java 프로그램과 DB를 연결해주는 드라이버 클래스 생성.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//강제로 클래스 객체를 깨우는 메서드 
			// 링크로 따오는 ojdbc6.jar 안에 있는 oracle.jdbc.driver 에 있는
			//OracleDriver 객체
			
			//3. DB 연동을 위한 클래스들의 객체를 생성
			/*
			 * a. Connection 객체
			 * :DB와의 연결(접속)을 위한 객체.
			 * Connection 객체는 new 연산자를 통해
			 * 직접 생성하는 것이 아니라, DriverManager 클래스가 제공하는
			 * 정적 메서드인 getConenection()을 호출하여 객체를 받아온다.
			 * 
			 */
			Connection conn = DriverManager.getConnection(url,uid ,upw);
			
			/*
			 * b. PreparedStatement 객체.
			 * :SQL문을 실행하기 위한 객체.
			 * PreparedStatement 객체는 conn 객체가 제공하는 메서드를 호출하여
			 * 객체를 받아옵니다.
			 * 매개값으로 실행시킬 sql문을 전달합니다.
			 */
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		
	}

}
