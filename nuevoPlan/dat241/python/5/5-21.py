import math

n = 2
ro = (1 + math.sqrt(5)) / 2
fn = int((ro ** n - (-ro ** -1) ** n) / math.sqrt(5))

print(fn)