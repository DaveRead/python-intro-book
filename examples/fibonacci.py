def fibonacci(position):
    if position == 0:
        return 0
    if position == 1:
        return 1

    return fibonacci(position - 1) + fibonacci(position - 2)

pos = 0
while pos < 10:
    print(fibonacci(pos), end = ',')
    pos = pos + 1

