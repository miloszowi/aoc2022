#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>


int main(void) {
  void draw(int cycle, int registryValue) {
    if (cycle % 40 == 0) printf("\n");
    printf("%s", abs(cycle % 40 - registryValue) < 2 ? "#" : ".");
  }
  
  char input [9];
  int cycle = 0;
  unsigned int registryValue = 1;

  while (1 == scanf("%[^\n]%*c", input)) {
    cycle += 1;
    draw(cycle, registryValue);

    if (strncmp(input, "n", 1) == 0) {
      continue;
    }
    
    int value = atoi(strrchr(input, ' ') + 1);
    registryValue += value;
    cycle += 1;
    draw(cycle, registryValue);
  }
  
  return 0;
}