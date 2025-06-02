import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots()

x = [0,5]
y = [0,7]

ax.plot(x, y, lw=2)
ax.scatter(5,7)

x = [0,-7]
y = [0,-5]

ax.plot(x, y, lw=2)

ax.set_xticks(np.arange(-8, 10, 2))  # De -10 a 10, pasos de 2
ax.set_yticks(np.arange(-8, 10, 2))

# No tocar FEAR:
ax.spines['left'].set_position('zero')
ax.spines['bottom'].set_position('zero')
ax.spines['right'].set_visible(False)
ax.spines['top'].set_visible(False)
ax.set_xlabel('x', x = 1.03, labelpad = -24)
ax.set_ylabel('y', y = 1.02, labelpad = -21, rotation = 0)
arrow_fmt = dict(markersize=4, color='black', clip_on=False)
ax.plot((1), (0), marker='>', transform=ax.get_yaxis_transform(), **arrow_fmt)
ax.plot((0), (1), marker='^', transform=ax.get_xaxis_transform(), **arrow_fmt)

plt.grid(True)
plt.show()
