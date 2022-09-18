To run this program (a3_wordfrequency.pde), click "Run" at the top of the
program to display the graph. This graph has "Words" on the y-axis and
"Appearance in text" on the x-axis. I used red circles to display the points
of each of the 143 entries in the wordfreqeuncy.txt. From the graph, we can
see that most words appear many times in the text, such as "the" and "and."
That is why most of the points are clustered towards the bottom right since
many words have similar frequenices, along with a few stragglers that follow
up the axes.I also implemented text rotation to label the y-axis.In the 
wordfrequency.txt the first entry is "1:3650" and the last entry is "2572:1".
These are the maximums for y-axis and x-axis, respectively. Hence, there is one
point at (1, 3650) and (2572, 1). I did have to adjust the scaling for this
graph using the formula ((xscale * x) + 20 ), ((yscale * y) - abs(y-970) ).
This is because my graph is a normal right hand graph with the axes going in
the positive up and right directions with the origin (0,0) on the bottom right.
Processing uses the top left as the origin(0,0) which made it tricky to convert
from processing coordinates to my coordinates. The x-axis was the easiest to
convert since to works the same in both coordinate systems(right is positive,
left is negative). The y- dimension was the hardest part of this program since
I had to figure out how to make the points at the top flip to the bottom and
vice versa. The graph is not an exact ratio if it was scaled to its actual dimensions.
I used a 1500x1000 grid size to give me as much room to work with but not
too big that it won't fit on a computer screen.