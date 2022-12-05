import java.util.*
 
fun main(args: Array<String>) {
    val stdin = readStdin()
    val stacks = List((stdin.first().length+1) / 4) { ArrayDeque<Char>() }

    run buildContainerStacks@{
        stdin.filter{
            s -> s.contains("[")
        }.forEach{
            val row = it.chunked(4)
            for (i in 0..row.size-1) {
                val container = row[i][1]

                if (!container.isWhitespace()) {
                    stacks[i].addFirst(container)
                }
            }
        }
    }
  
    run procedures@{
        stdin.filter{
            s -> s.startsWith("move")
        }.forEach{
            val (amount, origin, destination) = Regex("[0-9]+").findAll(it)
                .map(MatchResult::value)
                .map(String::toInt)
                .toList()
                
            val containersToMove = stacks[origin-1].toList().takeLast(amount)
            containersToMove.forEach {
                stacks[destination-1].add(it)
                stacks[origin-1].removeLast()
            }
        }
    }
    
    stacks.forEach{print(it.last())}
}

fun readStdin(): MutableList<String> {
    val stdin = mutableListOf<String>()
    while (true) {
        val line = readLine()
        if (line === null) break
        stdin.add(line)
    }
  
    return stdin
}