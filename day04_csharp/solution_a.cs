using System;
using System.Collections.Generic;
using System.Linq;

public class AdventOfCode
{
  public static void Main()
  {
    string[] assignmentPairs = (Console.In.ReadToEnd()).Split("\n");
    
    Console.WriteLine(new List<string>(assignmentPairs.Where(pair => isOverloaded(pair))).Count);
  }
  
  public static bool isOverloaded(string pair)
  {
    List<List<int>> ranges = new List<List<int>>() {
      new List<int>(pair.Split(",")[0].Split("-").Select(num => Int32.Parse(num))),
      new List<int>(pair.Split(",")[1].Split("-").Select(num => Int32.Parse(num)))
    };

    return (ranges[0][0] <= ranges[1][0] && ranges[0][1] >= ranges[1][1])
      || (ranges[1][0] <= ranges[0][0] && ranges[1][1] >= ranges[0][1]);
  }
}
