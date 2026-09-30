# AES-128 in Verilog

AES-128 encryption and decryption in Verilog, with a Python reference model (`AES_Python.txt`) used to check it.

The design loads a 128-bit plaintext and key as 4-bit serial inputs. It then runs 10 encryption rounds followed by 10 decryption rounds and outputs the recovered plaintext. Each round is its own hardware block, sequenced by a small FSM and chained together in `topmost.v`.

## Files

- `topmost.v`: top level that chains all 20 round blocks
- `top.v`, `topmid.v`, `toplast.v`: encryption rounds (first, 2–9, last)
- `dtop.v`, `dtopmid.v`, `dtoplast.v`: decryption rounds (first, 2–9, last)
- `sub_byte.v`, `mix_col.v`, `key_gen.v`, `addkey.v`: SubBytes (with ShiftRows), MixColumns, key expansion, AddRoundKey
- `isub_byte.v`, `imix_col.v`: the inverse operations for decryption
- `fsm*.v`, `dfsm*.v`: per-round control FSMs
- `sipo_data.v`: 4-bit serial-in, parallel-out input register
- `testbench.v`: full-system testbench

## Running

```bash
iverilog -o aes_sim -s testbench testbench.v topmost.v top.v topmid.v toplast.v \
  dtop.v dtopmid.v dtoplast.v fsm.v fsm_mid.v fsm_last.v dfsm.v dfsm_mid.v dfsm_last.v \
  sipo_data.v addkey.v sub_byte.v isub_byte.v mix_col.v imix_col.v key_gen.v
vvp aes_sim
```

The testbench uses the NIST FIPS-197 test vector:

| | Value |
| --- | --- |
| Plaintext | `3243f6a8885a308d313198a2e0370734` |
| Key | `2b7e151628aed2a6abf7158809cf4f3c` |
| Ciphertext | `3925841d02dc09fbdc118597196a0b32` |

Both the Verilog design and the Python model produce this ciphertext and decrypt it back to the original plaintext.
