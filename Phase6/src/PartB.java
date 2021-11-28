import java.sql.*;
public class PartB{

    /*Part B. Manipulating Query Results (50 points)

The goal of this part is to retrieve data using SQL select queries executed in your Java application 
and then manipulate the query results in Java. Your Java application should contain a function that 
does the following:
i.	Connect to the Oracle database we have been using in the course with your username and password.

ii.	Issue the following select queries for your corresponding database:
a.	SELECT * FROM Nurse;
b.	SELECT * FROM House;

iii.	Using the result set from the query in the previous step and Java, print the following for 
your corresponding database:
a.	Calculate the average salary for all nurses.
b.	Find all houses with a price between 100000 and 200000. 

iv.	Issue the following two select queries for your corresponding database:
a.	SELECT * FROM Physician; and SELECT * FROM Timecard;
b.	SELECT * FROM House; and SELECT * FROM Agent;

v.	Using the result set from the queries in the previous step and Java, print the following for your 
corresponding database:
a.	Find the names of all physicians who have not submitted a timecard.
b.	Retrieve the street address for all houses with an agent in the New Orleans office.

vi.	Close your database connection.*/

    public static void main(String[] args){
        try{
            //i.	Connect to the Oracle database we have been using in the course with your username and password.
            Class.forName("oracle.jdbc.driver.OracleDriver");	
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@dbserver.cs.uno.edu:1521/ORCL", "mgorgero", "Bisnap_Was_Cool817");	
            Statement state = conn.createStatement();
            //ii.	Issue the following select queries for your corresponding database:
            //a.	SELECT * FROM Nurse;
            ResultSet result = state.executeQuery("SELECT * FROM NURSE");
            //iii. Using the result set from the query in the previous step and Java, print the 
            //following for your corresponding database:
            //a. Calculate the average salary for all nurses
            result = state.executeQuery("SELECT AVG(Salary) FROM NURSE");//?
            System.out.println(result.getInt(1));
            //iv.	Issue the following two select queries for your corresponding database:
            //a.	SELECT * FROM Physician; and SELECT * FROM Timecard;
            result = state.executeQuery("SELECT * FROM Physician");
            result = state.executeQuery("SELECT * FROM TimeCard");
            //v.	Using the result set from the queries in the previous step and Java, 
            //print the following for your corresponding database:
            //a.	Find the names of all physicians who have not submitted a timecard.
            result = state.executeQuery("SELECT PhysicianName, Sum(Hours) FROM Physician LEFT OUTER JOIN TimeCard ON Physician.IDNumber = TimeCard.PhysicianID GROUP BY PhysicianName");

        }catch(Exception e){
            e.printStackTrace();
        }

    }

}