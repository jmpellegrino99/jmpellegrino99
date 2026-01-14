import numpy as np

def euclid(a, b):
    if a < b:
        a, b = b, a

    # Initialize the coefficients for the Extended Euclidean Algorithm
    arr1 = np.array([1, 0])  # Coefficients for `a`
    arr2 = np.array([0, 1])  # Coefficients for `b`

    while b != 0:
        to_subtr = a // b
        a, b = b, (a % b)
        
        # Update coefficients
        arr1, arr2 = arr2, arr1 - to_subtr * arr2
    
    return (arr1, a)

print(euclid(7, 3))
