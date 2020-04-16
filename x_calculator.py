#!/usr/bin/python3

import numpy as np

results = np.array([
    [6.0, 3.0, 1.15, 2.5, 1.1, 1.15],     # rudi
    [2.5, 2.5, 1.5, 2.0, 1.0, 1.5],       # sven
    [6.0, 2.0, 2.0, 3.0, 1.2, 3.0],       # franzi
    [2.0, 4.0, 1.11, 7.5, 1.06, 1.33],    # maxi
    [3.00, 5.00, 2.00, 3.00, 1.50, 3.00], # jannik
])

real = np.array([3.10, 4.17, 1.13, 4.66, 1.11, 1.10])

xss = []
for result in results:
    xs = result / real
    xss.append(xs)

xss_np = np.array(xss)

mean = np.mean(xss_np)
std = np.std(xss_np)

print('mean x: {}'.format(mean))
print('std  x: {}'.format(std))
