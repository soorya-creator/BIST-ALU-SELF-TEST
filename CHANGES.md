# Changes in this revision

## 1. LFSR was not maximal length (rtl/lfsr.v)
The original shifted right (`{feedback, q[7:1]}`) with taps on bits 7,5,4,3 and no tap on
`q[0]`, the bit that is shifted out. That makes the next-state function non-invertible:
from seed 8'hAC it visited only 34 states (3 transient + a 31-state loop).

Fix: shift left (`{q[6:0], feedback}`), keeping the taps x^8+x^6+x^5+x^4+1.
Result: all 255 non-zero states, period 255, returns to seed 8'hAC.

## 2. FSM opcode lagged the state by one clock (rtl/fsm.v)
`opcode` was assigned inside each state, so it changed one clock after `state`. With a
255-cycle LFSR period this gave ADD 256 vectors and OR only 254 (one LFSR state never
applied to OR). The opcode is now updated on the same edge as the state transition, so each
operation receives exactly one full LFSR period (255 distinct vectors).

## 3. Golden signature updated (rtl/top.v)
The test vectors changed, so the fault-free signature changed:
`5'b01100` -> `5'b11011` (verified by simulation: pass = 1).

## 4. Minor cleanups
- rtl/misr.v: `signature[4]^^alu_out[3]` -> `signature[4]^alu_out[3]` (same behaviour; `^^` is
  not a Verilog operator and can fail in stricter tools).
- rtl/top.v: declared `wire test_en;` explicitly.

## 5. Testbenches
- testbench/lfsr_tb.v: now self-checking (255 unique states, period 255, no zero state, PASS/FAIL).
- testbench/top_tb.v: prints final signature and pass at the end of the run.

## Not regenerated
`report/BIST_REPORT.pdf` and the waveform screenshots in `screenshots/` were produced from the
old design. They still show the old golden signature (01100) and old waveforms.
