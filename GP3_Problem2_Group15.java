import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
public class GP3_Problem2_Group15 {
	public static void main(String[] args) throws IOException, SQLException {
		/* Boring initialization. */
		String input;
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
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		/* Main loop is mostly self-documenting. I'm collecting input, branching based on it, then 
		 * jumping into PL/SQL. 
		 */
		while(true) {
			System.out.println("Type insert to insert a customer, hike to hike translators' wages,"
					+ " print to view the customer and translator tables, and exit to exit.");
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
				cs.setInt(1, id);
				cs.setString(2, name);
				cs.setString(3, level);
				cs.executeQuery();
			}
			if (input.equalsIgnoreCase("hike")) {
				String aname;
				System.out.println("What author would you like to particularly boost the translators of?");
				aname = br.readLine();
				if (aname.length() > 20) {
					System.out.print('\n');
					System.out.println("Please have strings of a length <=20 characters. Exiting the program to avoid"
							+ " having to put in logic here");
					System.exit(0);
				}
				CallableStatement cs = dbConnection.prepareCall("{call assignment2_procedures.hike_translators(?)");
				cs.setString(1, aname);
				cs.executeQuery();
			}
			if (input.equalsIgnoreCase("print")) {
				ResultSet custResults = stmt.executeQuery("SELECT * FROM CUSTOMER");
				System.out.println("Customer table");
				System.out.println("ID, Name, amount of orders, and level in that order");
				while (custResults.next()) {
					System.out.println((custResults.getInt(1) - 32) + ' ' + custResults.getString(2) + ' ' +
							custResults.getInt(3) + ' ' + custResults.getString(4));
				}
				//I have no idea why subtracting 32 from IDs is necessary but it is so whatever. 
				System.out.print('\n');
				ResultSet transResults = stmt.executeQuery("SELECT * FROM TRANSLATOR");
				System.out.println("Translator table");
				System.out.println("ID, Name, and salary in that order");
				while (transResults.next()) {
					System.out.println((transResults.getInt(1) - 32) + ' ' + transResults.getString(2) + ' ' +
							transResults.getFloat(3));
				}
			}
			if (input.equalsIgnoreCase("exit")) {
				System.exit(0);
			}
		
		
		
		
	}
}

}
