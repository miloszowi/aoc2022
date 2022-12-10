#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>


int main(void) {
  bool shouldRegister(int cycle) {
    return ((cycle - 20) % 40 == 0);
  }
  
  char input [9];
  int cycle = 1;
  unsigned int registryValue = 1;
  int sum = 0;

  while (1 == scanf("%[^\n]%*c", input)) {
    cycle += 1;
    sum += shouldRegister(cycle) ? cycle * registryValue : 0; 

    if (strncmp(input, "n", 1) == 0) {
      continue;
    }
    
    int value = atoi(strrchr(input, ' ') + 1);
    registryValue += value;
    cycle += 1;

    sum += shouldRegister(cycle) ? cycle * registryValue : 0; 
  }
  
  printf("%d", sum);
  return 0;
}