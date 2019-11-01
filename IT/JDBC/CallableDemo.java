import java.sql.*;

class CallableDemo {
	public static void main(String []args){
		try {
			String user = "root";
			String password = "";
			String url="jdbc:mysql://localhost/Student";

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);

			String query = "{ call NumberOfRows(?) }";
			CallableStatement cs = conn.prepareCall(query);
			cs.registerOutParameter(1, Types.INTEGER);
			cs.execute();
			int r = cs.getInt(1);
			cs.close();
			
			System.out.println("Total number of rows: " + r);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}
}
