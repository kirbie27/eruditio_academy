package eruditio.models;

import java.util.*;

public class ProgramList 
{
    ArrayList<Programs> list;
    
    public ProgramList()
    {
        list = new ArrayList<>();
        setProgramList(list);
    }
    
    //setters
    public void setProgramList(ArrayList list)
    {
        list.add(new Programs("/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/codingforkids.png",
                "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/program_coding.png", "Coding for Kids",
                "Teaching kids computer programming in the simplest and most enjoyable way"));
        list.add(new Programs("/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/compasCircle.png",
                "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/program_compass.png", "Compass",
                "Dramatically improve children's reading comprehension and communication skills"));
        
        list.add(new Programs("/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/instantReaderCircle.png",
               "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/program_reader.png", "Instant Reader",
               "Your child can read in English in just 20-days"));
        
        list.add(new Programs("/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/smartwriterCircle.png",
               "/2CSD_FAP_ARGANOSA_CARLOS_MARASIGAN_WENCESLAO/Assets/Pictures/program_writer.png", "Smart Writer",
               "Teaching kids to write effective essays and compositions"));  
        
     
    }
    //getters
    public ArrayList getProgramList()
    {
        return list;
    }
    
}
