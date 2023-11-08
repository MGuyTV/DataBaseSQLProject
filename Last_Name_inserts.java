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
        String[] tablePaths = {".\\Physician.csv",
                               ".\\TheTest.csv",
                               ".\\Patient.csv",
                               ".\\TheOrder.csv",
                               ".\\Nurse.csv",
                               ".\\Bed.csv",
                               ".\\TimeCard.csv"};//Could I use ./Timecard.csv instead for example?
        
        try{//somewheres in here, I need to output a string into an sql insertion file
            for(int i = 0; i < tablePaths.length; i++){//basically loop through each of the csv files, generating insert statements for each file
                Scanner s;
                s = new Scanner(new File(tablePaths[i]));
                s.useDelimiter(System.lineSeparator());//I had a lot of problems using just "\n" for the demimiter, so I had to use this instead
                String fileName = fileName(new File(tablePaths[i]));//table name 
                fileName = fileName.substring(0, fileName.length() -4);
                while(s.hasNext()){//Scan a particular csv file for values and input them into the sql file
                    
                    String value = s.next();
					
                   String sqlStatement = String.format("INSERT INTO %s VALUES (%s);\n", fileName, value);
                
                    //after this, write this statement to the file
                   File insertionSQL = new File("Orgeron_inserts.sql");
                   FileWriter writer = new FileWriter(insertionSQL, true);
                   writer.append(sqlStatement);
                   writer.close();
                }
                
                if(s.hasNext() == false)
                    s.close();
                
                
            }
            FileWriter w = new FileWriter("Orgeron_inserts.sql", true);
            w.append("COMMIT;");
            w.close();
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
