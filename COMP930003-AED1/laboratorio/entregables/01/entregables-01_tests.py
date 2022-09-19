import subprocess, random
import pandas as pd
from collections import deque
from tqdm import tqdm

def start(executable_file):
    return subprocess.Popen(
        executable_file,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)

def read(process):
    return process.stdout.readline().decode("utf-8").strip()

def write(process, message):
    process.stdin.write(f"{message.strip()}\n".encode("utf-8"))
    process.stdin.flush()

def terminate(process):
    process.stdin.close()
    process.terminate()
    process.wait(timeout=0.2)

def atoi(s):
    try:
        return int(s)
    except:
        if not s:
            return 0.0
        return atoi(s[:-1])

def outputVector(vector):
    output = [str(len(vector))] + [str(x) for x in vector]
    output = '\n'.join(output)
    return output

def estaOrdenado(l):
    process = start("./estaOrdenado.exe")
    write(process, outputVector(l))
    output = read(process)
    terminate(process)
    return output

def rotar(l, k):
    prompt = outputVector(l) + f'\n{k}'
    process = start("./rotar.exe")
    write(process, prompt)
    output = read(process)
    terminate(process)
    return output

def swap(a,b):
    process = start("./swap.exe")
    write(process, f'{a}\n{b}')
    output = read(process)
    terminate(process)
    return output

def division(a,b):
    outstring = None
    process = start("./division.exe")
    write(process, f'{a}\n{b}')
    outstring = read(process)
    terminate(process)
    return outstring

def fibonacci(n):
    process = start("./fibonacci.exe")
    write(process, f'{n}\n')
    output = read(process)
    terminate(process)
    return output

def test_division(k=100, max_range=1000):
    for i in tqdm(range(k)):
        a = random.randint(1,max_range)
        b = random.randint(1,max_range)
        output = division(a,b)
        output = output.split(' ')
        output = [atoi(x) for x in output]
        q = a//b
        r = a%b
        
        if q != output[0] or r != output[1]:
            print(a,b,q,r,output)
            return False
    return True

def randomIntegerArray(len, minv=-10, maxv=10, random_len=True):
    if random_len: 
        return [random.randint(minv,maxv) for x in range(random.randint(1,len))]
    else:
        return [random.randint(minv,maxv) for x in range(len)]

def test_rotar(k=100, max_len=100):
    for i in tqdm(range(k)):
        random_vector = randomIntegerArray(max_len)
        random_k = random.randint(0,1000)
        output = rotar(random_vector, random_k)
        output = output.split(' ')
        output = [atoi(x) for x in output]
        result = deque(random_vector)
        result.rotate(random_k)
        result = list(result)

        if output != result:
            return False
    
    return True

def issorted(lst):
    pairs = zip(lst, lst[1:])
    asc = next((a < b for a, b in pairs if a != b), None)
    return asc is None or all((a < b) == asc for a, b in pairs if a != b)

def randomSortedArray(len, minv=-10, maxv=10, random_len=True):
    random_vector = randomIntegerArray(len, minv=-10, maxv=10, random_len=True)
    if random.randint(0,1) == 1:
        random_vector.sort()
        if random.randint(0,1) == 1:
            random_vector.reverse()
            
    return (random_vector, issorted(random_vector))

def test_estaOrdenado(k=100, max_len=100):
    for i in tqdm(range(k)):
        random_vector, sortd = randomSortedArray(max_len)
        output = estaOrdenado(random_vector)
    
        if output != str(sortd):
            print(random_vector, sortd, output)
            return False
    return True

def test_fibonacci(max_n=46):
    fib = list(pd.read_csv('./fibonacci46.csv', header=None)[0])
    for i in tqdm(range(max_n)):
        if str(fib[i]) == fibonacci(i+1) == False:
            print(i)
            return False
    return True

def test_swap(k=100, max_range=1000):
    for i in tqdm(range(k)):
        a = random.randint(-max_range,max_range)
        b = random.randint(-max_range,max_range)
        output = swap(a,b)
        output = output.split(' ')
        output = [atoi(x) for x in output]

        if a != output[1] or b != output[0]:
            print(a,b, output)
            return False
    return True

def evaluate(result):
    print('Programa correctamente testeado.')
    if result:
        print('El programa es correcto para los casos evaluados.')
    else:
        print('El programa es incorrecto.')
    print()

if __name__ == '__main__':
    print('Testeando: Fibonacci\n')
    evaluate(test_fibonacci())

    print('Testeando: Division\n')
    evaluate(test_division())

    print('Testeando: Swap\n')
    evaluate(test_swap())

    print('Testeando: estaOrdenado\n')
    evaluate(test_estaOrdenado())

    print('Testeando: Rotar\n')
    evaluate(test_rotar())