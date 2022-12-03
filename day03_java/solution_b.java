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
        	String[] rucksacks = {scanner.nextLine(), scanner.nextLine(), scanner.nextLine()};
			totalSumOfPriorities += evaluatePriorityOfGroup(rucksacks);
        }
 
        scanner.close();
        
        System.out.println(totalSumOfPriorities);
    }
    
    private static int evaluatePriorityOfGroup(String[] rucksacks)
    {
        for (char item : rucksacks[0].toCharArray())
        {
        	String stringified = Character.toString(item);
        	
        	if (rucksacks[1].contains(stringified) && rucksacks[2].contains(stringified))
        	{
        		int priorityValue = ((int) Character.toLowerCase(item)) - 96;	
        		return Character.isLowerCase(item) ? priorityValue : priorityValue + 26;
        	}
        }
        
        return 0;
    }
}
