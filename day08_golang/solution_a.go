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
	
	var visibleTrees int = 0;
	for rowIndex, row := range rows {
		for columnIndex, treeHeight := range row {
			if (isVisible(rowIndex, columnIndex, treeHeight, rows)) {
				visibleTrees += 1
			}
		}
	}
	
	fmt.Printf("%d", visibleTrees)

    _ = str
}

func isVisible(rowIndex int, columnIndex int, treeHeight int, rows [][]int) bool {
    var columnSize int = len(rows) - 1
    var rowSize int = len(rows[0]) - 1
    var currentColumnIndex int = columnIndex
    var currentRowIndex int = rowIndex

	if (columnIndex == 0 || rowIndex == 0 || rowIndex == rowSize || columnIndex == columnSize) {
		return true
	}

    for true {
        currentColumnIndex += 1
        if (rows[rowIndex][currentColumnIndex] >= treeHeight) {
            break
        }

        if (currentColumnIndex == rowSize) {
            return true
        }
    }
    currentColumnIndex = columnIndex
    for true {
        currentColumnIndex -= 1
        if (rows[rowIndex][currentColumnIndex] >= treeHeight) {
            break
        }
        
        if (currentColumnIndex == 0) {
            return true
        }
    }
    for true {
        currentRowIndex -= 1
        if (rows[currentRowIndex][columnIndex] >= treeHeight) {
            break
        }
        
        if (currentRowIndex == 0) {
            return true
        }
    }
    currentRowIndex = rowIndex
    for true {
        currentRowIndex += 1
        if (rows[currentRowIndex][columnIndex] >= treeHeight) {
            break
        }
        
        if (currentRowIndex == columnSize) {
            return true
        }
    }
    
    return false
}
