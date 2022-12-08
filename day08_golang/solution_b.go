package main
import (
    "bufio"
    "os"
    "fmt"
    "strconv"
)
//refactor this pls

func main() {
	str := "well"

	rows := [][]int{}
	var row int = 0
	scanner := bufio.NewScanner(os.Stdin)
	
	for scanner.Scan() {
		currentRow := []int{}
    	for _, treeHeight := range scanner.Text() {
			current, _ := strconv.Atoi(string(treeHeight))
    		currentRow = append(currentRow, current)
    	}
    	rows = append(rows, currentRow)
    	row += 1
	}
	
	treeScenicScores := []int {};
	for rowIndex, row := range rows {
		for columnIndex, treeHeight := range row {
			treeScenicScores = append(treeScenicScores, getTreeScenicScore(rowIndex, columnIndex, treeHeight, rows))
		}
	}
	
	fmt.Printf("%d", max(treeScenicScores))

    _ = str
}

func getTreeScenicScore(rowIndex int, columnIndex int, treeHeight int, rows [][]int) int {
    var columnSize int = len(rows) - 1
    var rowSize int = len(rows[0]) - 1
    var currentColumnIndex int = columnIndex
    var currentRowIndex int = rowIndex
	var score int = 1
	var currentMultiplier int = 0
	if (columnIndex == 0 || rowIndex == 0 || rowIndex == rowSize || columnIndex == columnSize) {
		return 1
	}
    for true {
        currentMultiplier += 1
        currentColumnIndex += 1
        if (rows[rowIndex][currentColumnIndex] >= treeHeight) {
            break
        }

        if (currentColumnIndex == rowSize) {
            break
        }
    }
	score *= currentMultiplier
	currentMultiplier = 0
    currentColumnIndex = columnIndex
    for true {
        currentMultiplier += 1
        currentColumnIndex -= 1
        if (rows[rowIndex][currentColumnIndex] >= treeHeight) {
            break
        }
        
        if (currentColumnIndex == 0) {
            break
        }
    }
	score *= currentMultiplier
	currentMultiplier = 0
    for true {
        currentMultiplier += 1
        currentRowIndex -= 1
        if (rows[currentRowIndex][columnIndex] >= treeHeight) {
            break
        }
        
        if (currentRowIndex == 0) {
            break
        }
    }
	score *= currentMultiplier
	currentMultiplier = 0
    currentRowIndex = rowIndex
    for true {
        currentMultiplier += 1
        currentRowIndex += 1
        if (rows[currentRowIndex][columnIndex] >= treeHeight) {
            break
        }
        
        if (currentRowIndex == columnSize) {
            break
        }
    }
    score *= currentMultiplier
    return score
}

func max(arr []int) int {
   max_num := arr[0]
   for i:=0; i<len(arr); i++{
      if arr[i] > max_num {
         max_num = arr[i]
      }
   }
   return max_num
}
