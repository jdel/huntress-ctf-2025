using binaryninja to analyze, follow the code starting `main__crackme_u20` at `140012ee1`

we can find a function called `buildEncodedFlag__crackme_u18` at adress `0x140012c02` and `xorStrings__crackme_u3` juste after at `0x140012c6b`

the string built by `buildEncodedFlag__crackme_u18` is:

```
0x28 0x05 0x0c 0x47 0x12 0x4b 0x15 0x5c 0x09 0x12 0x17 0x55 0x09 0x4b 0x42 0x08 0x55 0x5a 0x45 0x58 0x44 0x57 0x45 0x77 0x5d 0x54 0x44 0x5c 0x45 0x13 0x59 0x5b 0x47 0x42 0x5e 0x59 0x16 0x5d

28050c47124b155c09121755094b4208555a4558445745775d54445c4513595b47425e59165d
```

`xorStrings__crackme_u3` uses the xor key `0x17` but applying it to the value above doesn't lead anywhere

the xor operation `*(var_20_1 + var_40 + 8) = *(rdx_1 + temp1_1 + 8) ^ *(var_20_1 + rdx + 8)` at `0x140012ae7` seems to be a bit more convoluted than a straight xor

probably need a windows machine for dynamic analysis to make it easier