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
                               "C:\\Users\\orger\\source\\repos\\dbms\\TimeCard.csv"};//Could I use ./Nurse.csv instead for example?
        
        try{//somewheres in here, I need to output a string into an sql insertion file
            for(int i = 0; i < tablePaths.length; i++){//basically loop through each of the csv files, generating an insert statement
                Scanner s = new Scanner(new File(tablePaths[i]));//cvs file
                s.useDelimiter("\n");//will this work?
                String fileName = fileName(new File(tablePaths[i]));//table name 
                fileName = fileName.substring(0, fileName.length() -4);
                while(s.hasNext()){
                //get the
                    String value = s.next();
                  //  System.out.println(value);
                   // value = value + "\n";
               //    System.out.println(value);
                    //value = value.substring(0, fileName.length() -1);
    
                    String sqlStatement = String.format("INSERT INTO %s VALUES (%s);\n", fileName, value);
                  //  System.out.print(sqlStatement);
                    //after this, write this statement to the file
                    File insertionSQL = new File("Orgeron_inserts.sql");
                    FileWriter writer = new FileWriter(insertionSQL, true);
                    writer.append(sqlStatement);
                    writer.close();

                }
                if(s.hasNext() == false)
                    s.close();


            }
           /* FileWriter w = new FileWriter("Orgeron_inserts.sql");
            w.write("COMMIT;");
            w.close();*/
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }
        catch(IOException e){
            e.printStackTrace();
        }


    }

    public static String fileName(File file){
       return file.getName();
    }


}