//Step 1 Load the Java classes 
import java.sql.*;
import java.io.*;
import java.io.FileNotFoundException;
import java.util.Scanner;
/*Part A. Loading Data (50 points)

The goal of this part is to load data using SQL insert commands executed in your Java application.
 If you are working on the Hospital Database, use the Timecard table. If you are working on the Real
  Estate Database, use the Buyer table. Your Java application should contain a function that does the
   following.

i.	Connect to the Oracle database we have been using in the course with your username and password.

ii.	Issue the command DELETE FROM [Timecard/Buyer];. This will delete all the records in the table;
 it is unnecessary to drop and create the table. Note that neither of these tables should not be
  referenced by any foreign keys so you should not have referential integrity errors.

iii.	Read the data line by line from the corresponding CSV file you created earlier in the project
 (or you can create new CSV files). Again, a CSV is simply a text file that stores comma separated 
 values. Having comma separated values allows you easily separate individual values. Values in the 
 CSV cannot have quotes around them.

iv.	In the for loop that you read the file line by line, execute an INSERT statement to insert the 
data from that line. Hint: Remember prepared statements that we talked about in class. Using 
prepared statements and splitting each line on the comma will simplify this task. 

v.	Close your database connection.*/


public class PartA{
	public static void main(String args[]){
		try{
			//Step 2 Load the driver class
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//Step 3 Create the connection object, step 1, connect to the oracle database:
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@dbserver.cs.uno.edu:1521/ORCL", "mgorgero", "Bisnap_Was_Cool817"); //Change these to your user/pass
			

			//Step 4 Create the Statement Object
			Statement state = conn.createStatement();
			
            String delete = "DELETE FROM TIMECARD";
            try{//Step 2, delete everything from the timecard table
                state.executeUpdate(delete);
            }catch(Exception e){
                System.err.println("Delete failed: " + e);
            }
            //Step 3, read the CSV file in line by line
            try{
                //Create prepared statement:
                String insert = "INSERT INTO TimeCard VALUES(?, ?, ?)";
                PreparedStatement insertTimeCard = conn.prepareStatement(insert);
                Scanner s = new Scanner(new File(".\\TimeCard.csv"));
                s.useDelimiter(System.lineSeparator());//This should let us loop through this line by line
                while(s.hasNext()){
                    String str = s.next();
                    String[] array = str.split(",");//We should have a row of the csv inserts delimited by ,'s'
                    array[0] = "\"" + array[0] + "\"";//this should each string the quotations that they need.
                    //Step 4, insert this data from this line into the database.
                    insertTimeCard.setString(1, array[0]);
                    insertTimeCard.setInt(2, Integer.valueOf(array[1]));//make sure the csv file does not
                    insertTimeCard.setInt(3, Integer.valueOf(array[2]));//have any whitespaces or converting from string to int won't work
                    System.out.println("hello" + array[1]);
                    insertTimeCard.executeUpdate();
                    
                }
            }catch(FileNotFoundException e){
                e.printStackTrace();
            }
			//Step 6 Close the Database Connection
			conn.close();
		} 
		catch(Exception e){
			e.printStackTrace();
		}
	}	
}