import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
public class GP3_Problem2_Group15 {
	public static void main(String[] args) throws IOException, SQLException {
		//Initialization, nothing of much importance or interest
		tring input;
		Connection dbConnection = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			}
		catch(Exception x){
			System.out.println("Unable to load the driver class!");
			System.exit(0);
			}
		try{
			dbConnection=DriverManager.getConnection
			("jdbc:oracle:thin:@//oracle.cs.ou.edu:1521/pdborcl.cs.ou.edu","hedg2770", "FPxh7Vi7");
			}
			catch( SQLException x ){
			System.out.println("Couldn’t get connection!");
			System.exit(0);
			}
		Statement stmt = null;
		try {
			stmt = dbConnection.createStatement();
		} catch (SQLException e1) {
			System.err.println("SQLException: " + e1.getMessage());
		}
		System.out.println("Type insert to insert a customer, hike to hike translators' wages,"
				+ " print to view the customer and translator tables, and exit to exit.");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		while(true) {
			input = br.readLine();
			if (input.equalsIgnoreCase("insert")) {
				//insert
				int id = 0;
				String name;
				String level;
				System.out.print("What ID would you like the customer to have?");
				try {
					id = Integer.parseInt(br.readLine());
				}
				catch (NumberFormatException e) {
					System.out.print('\n');
					System.out.println("Please enter an integer for ID. Exiting the program to avoid"
							+ " having to put in logic here");
					System.exit(0);
				}
				System.out.print('\n');
				System.out.println("What would you like the customer's name to be?");
				name = br.readLine();
				if (name.length() > 20) {
					System.out.print('\n');
					System.out.println("Please have strings of a length <=20 characters. Exiting the program to avoid"
							+ " having to put in logic here");
					System.exit(0);
				}
				System.out.print('\n');
				System.out.println("What reading level would you like the customer to have?");
				level = br.readLine();
				if (level.length() > 20) {
					System.out.print('\n');
					System.out.println("Please have strings of a length <=20 characters. Exiting the program to avoid"
							+ " having to put in logic here");
					System.exit(0);
				}
				CallableStatement cs = dbConnection.prepareCall("{call assignment2_procedures.insert_customer(?, ?, ?)");
				cs.setInt(0, id);
				cs.setString(1, name);
				cs.setString(2, level);
				cs.executeQuery();
			}
			if (input.equalsIgnoreCase("hike")) {
				CallableStatement cs = dbConnection.prepareCall("{call assignment2_procedures.hike_translators");
				cs.executeQuery();
			}
			if (input.equalsIgnoreCase("print")) {
				ResultSet custResults = stmt.executeQuery("SELECT * FROM CUSTOMER");
				System.out.println("Customer table");
				System.out.println("ID, Name, amount of orders, and level in that order");
				boolean going = true;
				while (going) {
					System.out.println(custResults.getInt(0) + ' ' + custResults.getString(1) + ' ' +
							custResults.getInt(2) + ' ' + custResults.getString(3));
					going = custResults.next();
				}
				System.out.print('\n');
				ResultSet transResults = stmt.executeQuery("SELECT * FROM TRANSLATOR");
				System.out.println("Translator table");
				System.out.println("ID, Name, and salary in that order");
				going = true;
				while (going) {
					System.out.println(transResults.getInt(0) + ' ' + transResults.getString(1) + ' ' +
							transResults.getFloat(2));
					going = transResults.next();
				}
			}
			if (input.equalsIgnoreCase("exit")) {
				System.exit(0);
			}
		
		
		
		
	}
}

}
