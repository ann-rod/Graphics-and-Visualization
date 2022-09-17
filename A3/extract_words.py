import os.path
import logging

# paths to text files
INPUT_NOVEL_PATH = 'greatGatsby.txt'
ALL_WORDS_PATH = 'allwords.txt'
UNIQUE_WORDS_PATH = 'a3_novelvisualization/data/uniquewords.txt'
WORD_FREQUENCY_PATH = 'a3_wordfrequency/data/wordfrequency.txt'

# global dictionaries
allWords = {}
frequencies = {}

def removePunct(line: str) -> str:
    '''
    Removes punctuation and numbers from a given string.

    Args:
        line (str): a user-given string

    Returns:
        line (str): the same given string with punctuation and numbers
                    removed.
    '''
    punctuation = '.,:[]-*;!#1234567890"“”—‘’?()/$'
    for char in line:
        if(char in punctuation):
            line = line.replace(char,'')
    return line


def createAllWords(lines: list[str]) -> None:
    '''
    Parses through all strings in an array of strings and fills in the global
    dictionary allWords with every word in the array. Also writes every word
    in the array into a text file at ALL_WORDS_PATH.

    Args:
        lines (list[str]): a list of strings
    '''
    if(os.path.exists(ALL_WORDS_PATH)):
        logging.error(ALL_WORDS_PATH+' already exists. Please remove from directory to continue.')
        return
    else:
        for i in range(len(lines)):
            lines[i] = lines[i].lower().strip()
            lines[i] = removePunct(lines[i])
            
            words = lines[i].split()
            for j in range(len(words)):
                words[j] = words[j].strip()

                if(words[j] not in allWords):
                    allWords[words[j]] = 1
                else:
                    allWords[words[j]] += 1

                with open(ALL_WORDS_PATH, 'a') as a:
                    a.write(words[j]+'\n')


def uniqueWords():
    '''
    Parses through each key in the global dictionary allWords and
    creates a text file at UNIQUE_WORDS_PATH containing every word
    with a value of 1 in the dictionary.
    '''
    if(os.path.exists(UNIQUE_WORDS_PATH)):
        logging.error(UNIQUE_WORDS_PATH+' already exists. Please remove from directory to continue.')
        return
    else:
        for word in allWords:
            if(allWords[word] == 1):
                with open(UNIQUE_WORDS_PATH, 'a') as u:
                    u.write(word+'\n')


def fillFrequencies():
    '''
    Parses through global dictionary allWords and fills in the global
    dictionary frequencies. Each key/value pair in frequencies consists
    of a frequency (key) and a number of words that appear at that
    frequency (value).
    '''
    for word in allWords:
        freq = allWords[word]
        if(freq not in frequencies):
            frequencies[freq] = 1
        else:
            frequencies[freq] += 1


def wordFrequency():
    '''
    Takes the data stored in the global dictionary frequencies and
    prints it to a file at WORD_FREQUENCY_PATH in order of increasing
    frequency.
    '''
    if(os.path.exists(WORD_FREQUENCY_PATH)):
        logging.error(WORD_FREQUENCY_PATH+'already exists. Please remove from directory to continue.')
        return
    else:
        keys = frequencies.keys()
        for i in range(max(frequencies.keys())+1):
            if(i in frequencies):
                with open(WORD_FREQUENCY_PATH, 'a') as w:
                    w.write(str(i)+':'+str(frequencies[i])+'\n')


def main():
    logging.basicConfig(level=logging.WARNING)
    
    if(os.path.exists(INPUT_NOVEL_PATH)):
        with open(INPUT_NOVEL_PATH, 'r') as f:
            lines = f.readlines()
            createAllWords(lines)
            uniqueWords()
            fillFrequencies()
            wordFrequency()
    else:
        logging.error(INPUT_NOVEL_PATH+'does not exist. Make sure input file is in correct directory.')
        
        
if __name__ == '__main__':
    main()
