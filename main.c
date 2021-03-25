#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <string.h>

int fib(int n) {
  if (n < 2) return 1;
  return fib(n-1) + fib(n-2);
}

size_t _strlen(const char* text) {
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

void xor_encode(char* data, size_t data_len, const char* key, size_t key_len) {
  for (size_t i=0; i<data_len; i++) {
    data[i] ^= key[i%key_len];
  }
}


int main() {

  char text[20] = {0};
  const char* key = "leetsp33k";
  strncpy(text, "Yo ho ho and a bottle fo rum!", 19);

  xor_encode(text, _strlen(text), key, _strlen(key));

  uint64_t feedbeef = byteswap(0xEFBEEDFE00000000LL);
  feedbeef = _strlen(text);
  feedbeef = fib(feedbeef);

  return 0;
}
