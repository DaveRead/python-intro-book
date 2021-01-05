# Conduct a binary search
# Two base cases:
#    1. Match found
#    2. No match found
def binary_search(wordlist, searchterm, startpos, endpos):
    checkpos = (startpos + endpos) // 2

    print('binary_search called for searchterm:' + searchterm +  
        ' startpos:' + str(startpos) + ' endpos:' + str(endpos))
    print('checkpos:' + str(checkpos) + ' word at list element:' + 
        wordlist[checkpos] + '\n')

    if searchterm == wordlist[checkpos]:
        # Words match - return the matching position
        return checkpos
    elif searchterm < wordlist[checkpos]:
        # search term comes earlier in list
        # change ending position
        endpos = checkpos - 1
    else:
        # search term comes later in the list
        # change starting position
        startpos = checkpos + 1

    # See if there are still more words to check
    if startpos <= endpos:
        # Still more words to check, make recursive call
        return binary_search(wordlist, searchterm, startpos, endpos)
    else:
        # No more words to check, the word is not in the list
        return -1

fruits = [ "apple", "banana", "cherry", "date", "elderberry", 
    "fig","grape", "honeydew", "jujube", "kiwi" ]
position = binary_search(fruits, "jujube", 0, len(fruits) - 1)
print('Found jujube?', position)
    
print('===============================')
    
position = binary_search(fruits, "carrot", 0, len(fruits) - 1)
print('Found carrot?', position)


