scale = 1000000

def createArray() :
    
    primes = [0] * (scale - 1)
    
    for i in range(2, scale + 1) :
        primes[i - 2] = i
    
    return primes

def primeSeive(primes) :
    for index in range(int(scale / 2)) :

        i = index + 1
        
        while i < len(primes) :
            if primes[i] % primes[index] == 0 :
                del primes[i]
            else :
                i += 1
    return

primes = createArray()

primeSeive(primes)

print(len(primes)/scale)

product = 1.0

for i in primes :
    product *= (i - 1) / i

print(product)