import java.util.*
 
fun main(args: Array<String>) {
    val stacks = readContainersIntoStacks()
    val procedures = readProcedures()
    
    for (procedure in procedures) {
        val origin = procedure[1] - 1
        val destination = procedure[2] - 1
      
        for (i in 1..procedure[0]) {
            stacks[destination].add(stacks[origin].removeAt(stacks[origin].size - 1))
        }
    }
    
    stacks.forEach{print(it.last())}
}

fun readContainersIntoStacks(): MutableList<MutableList<Char>> {
    val stacks = mutableListOf<MutableList<Char>>()
    
    while (true) {
        val line = readLine().toString()
        if (line.contains("[0-9]".toRegex())) {
            readLine()
            break
        }
        val chunkedLine = line.chunked(4)
    
        for (i in 0..chunkedLine.size-1) {
            val container = chunkedLine[i][1]

            if (i !in stacks.indices) {
                stacks.add(mutableListOf<Char>())
            }            
            if (!container.isWhitespace()) {
                stacks[i].add(container)
            }
        }
    }

    stacks.forEach{it.reverse()}
    return stacks
}

fun readProcedures(): MutableList<List<Int>> {
    val procedures = mutableListOf<List<Int>>()
    while (true) {
        val procedure = readLine()
        if (procedure == null) break
        procedures.add(
            Regex("[0-9]+").findAll(procedure)
                .map(MatchResult::value)
                .map(String::toInt)
                .toList()
        )
    }
  
    return procedures
}