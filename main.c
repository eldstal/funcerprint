#include <stdio.h>
#include <stdint.h>
#include <unistd.h>

int fib(int n) {
  if (n < 2) return 1;
  return fib(n-1) + fib(n-2);
}

size_t _strlen(char* text) {
  size_t len = 0;
  for (len=0; *text!=0; len++) text++;
  return len;
}

uint64_t byteswap(uint64_t in) {
  uint64_t out;

  uint8_t* b_in = (uint8_t*) &in;
  uint8_t* b_out = (uint8_t*) &out;

  for (size_t i=0; i<8; i++) {
    b_out[i] = b_in[7-i];
  }

  return out;
}


int main() {

  return 0;
}
