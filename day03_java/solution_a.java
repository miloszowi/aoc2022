import java.util.Scanner;
import java.util.ArrayList;
import static java.lang.Character.*;


class AdventOfCode
{
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);
		int totalSumOfPriorities = 0;
	
        while (scanner.hasNextLine())
        {
			totalSumOfPriorities += evaluatePriority(scanner.nextLine());
        }
 
        scanner.close();
        
        System.out.println(totalSumOfPriorities);
    }
    
    private static int evaluatePriority(String rucksack)
    {
    	String[] compartments = rucksack.split("(?<=^|\\G.{" + rucksack.length()/2 + "})");

        for (char item : compartments[0].toCharArray())
        {
        	if (compartments[1].indexOf(item) > -1)
        	{
        		int priorityValue = ((int) Character.toLowerCase(item)) - 96;	
        		return Character.isLowerCase(item) ? priorityValue : priorityValue + 26;
        	}
        }
        
        return 0;
    }
}
