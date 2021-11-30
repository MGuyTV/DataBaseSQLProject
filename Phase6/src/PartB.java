import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;
import java.util.Arrays;
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
            int i = 0;
            int sum = 0;
            while(result.next()){
                sum += result.getInt(3);
                i++;
            }
            int average = sum / i;
            System.out.println(average);
            //iv.	Issue the following two select queries for your corresponding database:
            //a.	SELECT * FROM Physician; and SELECT * FROM Timecard;
            result = state.executeQuery("SELECT * FROM TimeCard");
            int j = 0;
            while(result.next()){
                j++;//doing this will get the lenth of the array that will be made.
            }
            result = state.executeQuery("SELECT * FROM TimeCard");
            int[] timeCardPhysID = new int[j];
            for(int k = 0; result.next(); k++){
                timeCardPhysID[k] = result.getInt(2);
            }
            result = state.executeQuery("SELECT * FROM Physician");
            i = 0;
            while(result.next()){
                i++;//this is to get the length of the two arrays that we are about to initialize
            }
            int x = i;//save i for later
            result = state.executeQuery("SELECT * FROM Physician");
            int[] physID = new int[i];
            String[] names = new String[i];
            for(int k = 0; result.next(); k++){
                physID[k] = result.getInt(1);
                names[k] = result.getString(2);
            }
            //v.	Using the result set from the queries in the previous step and Java, 
            //print the following for your corresponding database:
            //a.	Find the names of all physicians who have not submitted a timecard.
            //now that we did all of that, we just have to compare arrays to find the odd one out:
            
            Set<Integer> set1 = new TreeSet<>();
            for(int a : timeCardPhysID)
                set1.add(a);
            Set<Integer> set2 = new TreeSet<>();
            for(int b : physID)
                set2.add(b);
            Set<Integer> bothSets = new HashSet<Integer>(set1);
            bothSets.addAll(set2);
            Set<Integer> cross = new HashSet<Integer>(set1);
            cross.retainAll(set2);
            bothSets.removeAll(cross);
            for(Integer n : bothSets){
                for(i = 0; i < physID.length; i++){
                    if(n == physID[i])
                        System.out.println(names[i]);
                }
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }

    }

}