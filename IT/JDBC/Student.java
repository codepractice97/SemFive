import java.sql.*;

class Student {
	public static void main(String[] args){
		try {
			String user = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/Student";
			// Register JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,user,password);
			Statement stmt = conn.createStatement();

			String query = "SELECT count(*) FROM Student";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Total Number of Students are: " + rs.getInt("count(*)"));

			query = "SELECT avg(IT), avg(TOC), avg(SP), avg(MICROPROCESSOR) FROM Result";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Average marks in IT are: " + rs.getFloat("avg(IT)"));
			System.out.println("Average marks in SP are: " + rs.getFloat("avg(SP)"));
			System.out.println("Average marks in TOC are: " + rs.getFloat("avg(TOC)"));
			System.out.println("Average marks in MICROPROCESSOR are: " + rs.getFloat("avg(MICROPROCESSOR)"));

			query="SELECT Name, (TOC+SP+IT+MICROPROCESSOR) as total from Result,Student where Student.`Roll Num`=Result.`Roll Num` order by total DESC";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println(rs.getString("name") + " scored highest marks: " + rs.getFloat("total"));

			query = "SELECT count(`Roll Num`) from Result where (IT+SP+TOC+MICROPROCESSOR)/4>=80";
			rs = stmt.executeQuery(query);
			rs.next();
			int first_div = rs.getInt("count(`Roll Num`)");
			System.out.println("Number of Students passing with first division: " + first_div);

			query = "SELECT count(`Roll Num`) from Result where (IT+SP+TOC+MICROPROCESSOR)/4>=70";
			rs = stmt.executeQuery(query);
			rs.next();
			int second_div = rs.getInt("count(`Roll Num`)") - first_div;
			System.out.println("Number of Students passing with second division: " + second_div);

			query = "SELECT count(`Roll Num`) from Result where (IT+SP+TOC+MICROPROCESSOR)/4>=60";
			rs = stmt.executeQuery(query);
			rs.next();
			int third_div = rs.getInt("count(`Roll Num`)") - second_div;
			System.out.println("Number of Students passing with third division: " + third_div);

			query = "SELECT Name from Student,Result where IT=(SELECT max(IT) from Result) and Student.`Roll Num`=Result.`Roll Num`";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Student with higest marks in IT: " + rs.getString("Name"));

			query = "SELECT Name from Student,Result where TOC=(SELECT max(TOC) from Result) and Student.`Roll Num`=Result.`Roll Num`";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Student with higest marks in TOC: " + rs.getString("Name"));

			query = "SELECT Name from Student,Result where SP=(SELECT max(SP) from Result) and Student.`Roll Num`=Result.`Roll Num`";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Student with higest marks in SP: " + rs.getString("Name"));

			query = "SELECT Name from Student,Result where MICROPROCESSOR=(SELECT max(MICROPROCESSOR) from Result) and Student.`Roll Num`=Result.`Roll Num`";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Student with higest marks in MICROPROCESSOR: " + rs.getString("Name"));
			
			query = "SELECT avg(TOC+SP+IT+MICROPROCESSOR) as average from Result";
			rs = stmt.executeQuery(query);
			rs.next();
			System.out.println("Average marks: " + rs.getFloat("average"));

			query="SELECT Name, (TOC+SP+IT+MICROPROCESSOR) as total from Result,Student where Student.`Roll Num`=Result.`Roll Num` order by total DESC";
			rs = stmt.executeQuery(query);
			rs.next(); rs.next();
			System.out.println(rs.getString("name") + " scored second highest marks: " + rs.getFloat("total"));
			
			stmt.close();
			conn.close();
		} catch (SQLException e){
			System.out.println("Error: " + e);
		} catch (Exception e){
			System.out.println(e);
		}
	}
}
