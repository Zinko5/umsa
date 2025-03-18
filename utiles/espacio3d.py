import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure()
ax = fig.add_subplot(projection='3d')

x1 = [0, 10]
y1 = [0, 0]
z1 = [0, 0]
# ax.plot3D(x1, y1, z1, lw=2)

x2 = [0, 0]
y2 = [0, 10]
z2 = [0, 0]
# ax.plot3D(x2, y2, z2, lw=2)

x2 = [0, 0]
y2 = [0, 0]
z2 = [0, 10]
# ax.plot3D(x2, y2, z2, lw=2)

ax.scatter3D(0, 0, 0)

ax.set_xticks(np.arange(0, 10, 2))
ax.set_yticks(np.arange(0, 10, 2))
ax.set_zticks(np.arange(0, 10, 2))

# No tocar
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

ax.grid(True)
# plt.show()
plt.savefig('grafico_3d.png', bbox_inches='tight')