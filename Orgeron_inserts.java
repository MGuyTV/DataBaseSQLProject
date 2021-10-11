import java.util.Scanner;
import java.io.*;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
public class Orgeron_inserts{

    public static void main(String[] args){
        //read in one csv file
        //generate a statement that can convert the content of that csv file into a string insert instructions
        //write the insert instructions into a csv file
        
        //double slash because of the special formatting
        String[] tablePaths = {"C:\\Users\\orger\\source\\repos\\dbms\\Nurse.csv",
                               "C:\\Users\\orger\\source\\repos\\dbms\\Order.csv",
                               "C:\\Users\\orger\\source\\repos\\dbms\\Bed.csv",
                               "C:\\Users\\orger\\source\\repos\\dbms\\Physician.csv",
                               "C:\\Users\\orger\\source\\repos\\dbms\\Test.csv",
                               "C:\\Users\\orger\\source\\repos\\dbms\\TimeCard.csv"};
        
        try{//somewheres in here, I need to output a string into an sql insertion file
            for(int i = 0; i < tablePaths.length; i++){//basically loop through each of the csv files, generating an insert statement
                Scanner s = new Scanner(new File(tablePaths[i]));//cvs file
                s.useDelimiter("\n");//will this work?
                String fileName = fileName(new File(tablePaths[i]));//table name 
                while(s.hasNext()){
                //get the
                    String value = s.next();
                    String sqlStatement = String.format("INSERT INTO %s VALUES (%s);\n", fileName, value);
                    //after this, write this statement to the file
                }


            }
            //after the for loop is finished, append a COMMIT statement ot the end of the file
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }


    }

    public static String fileName(File file){
       return file.getName();
    }


}