phrase = 'To be or not to be'
trans = str.maketrans('eo', '30')
newphrase = phrase.translate(trans)
print(phrase, '|', newphrase)


data = 'Temps today will range from 25 to 42'
alter = str.maketrans('aeiou', 'AEIOU', '0123456789');
newdata = data.translate(alter)
print(data, '|', newdata)

