fname = input('Enter the file name: ')
fhand = None
try:
    fhand = open(fname)
    count = 0
    for line in fhand:
        if line.startswith('Subject:') : 
            count = count + 1
    print('There were', count, 'subject lines in', fname)
except Exception as err:
    print('File', fname, 'cannot be processed, caused by:', err)
    exit()
finally:
    if fhand != None:
        fhand.close()
