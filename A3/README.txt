There are three program files in this repository that must be
run separately. The first program to be run should be 
extract_words.py and then order doesn't matter. Instructions on 
running each file below:

WARNING: Prior to running extract_words.py, do not move
         greatGatsby.txt from the A3 directory.
 
         Post running extract_words.py, do not move
         uniqueWords.txt or wordFrequency.txt from
         their respective directories.

         All text file paths relative to A3 written
         at the bottom of this document for reference.

1. extract_words.py: reads in greatGatsby.txt and creates
                     allwords.txt, uniquewords.txt and
                     wordfrequency.txt from it in 
                     respective directories.
 
    This python file can be run on an IDE or via the
    command line. 
    
    To run via the command line in the terminal, change
    into the directory holding this program and type:
        python3 extract_words.py
    This should run the program and create all text
    files.  

    Since each IDE is different, we will
    leave running via IDE up to user discretion.

    NOTE: In order for the program to function properly,
          allwords.txt, uniquewords.txt, and
          wordfrequency.txt must NOT already exist at the 
          paths specified within the program. This will 
          throw an error.

          To fix this, simply remove the pre-existing text 
          files from the directory. They will be replaced 
          when the program runs successfully.


2. a3_novelvisualization.pde: Reads in uniquewords.txt and
			      uses IMPRISHA.TTF as the font.

After ensuring that the pde file is in a directory with the
same name and that both uniquewords.txt and IMPRISHA.TTF are
in the data directory, running this file should be as simple
as opening the file and hitting run to generate the canvas.
Clicking the canvas with the mouse will generate a new set
of words.


3. a3_wordfrequency.pde:



Text file paths:

A3/greatGatsby.txt
A3/allWords.txt
A3/a3_novelvisualization/data/uniquewords.txt
A3/a3_wordfrequency/data/wordfrequency.txt
