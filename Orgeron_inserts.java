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
        String path = "C:\\Users\\orger\\source\\repos\\dbms";//double slash because of the special formatting
        String[] tableNames = {"Bed", "Nurse", "Order","Physician", "Test", "Timecard"};
        ArrayList<String> insertStatement= new ArrayList<String>();
        
        try{
            Scanner s = new Scanner(new File(path));
            s.useDelimiter(",");
            while(s.hasNext()){

            }
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }


    }


}