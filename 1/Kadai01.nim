import strformat

proc midPointInt(a, b: float64, n: int, f: proc(x: float64): float64): float64 =
  result = 0.0
  for k in 0 ..< int(n):
    result += f(a + (k.toFloat + 0.5) * (b - a) / n.toFloat)
  result *= (b - a) / n.toFloat

func f(x: float64): float64 =
  return 1 / x

const
  a = 1.0
  b = 2.0
var
  N = 1
  T = (b - a) * (f(a) + f(b)) / 2.0
  M = midPointInt(a, b, N, f)
  S = (T + 2.0 * M) / 3.0
echo fmt"N = {N:4}    M = {M:16.14f}   T = {T:16.14f}    S = {S:16.14f}"
for m in 1..10:
  T = (T + M) / 2.0
  N *= 2
  M = midPointInt(a, b, N, f)
  S = (T + 2.0 * M) / 3.0
  echo fmt"N = {N:4}    M = {M:16.14f}   T = {T:16.14f}    S = {S:16.14f}"
