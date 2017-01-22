# An algorithm to find whether or not a path exists between two vertices A and B

# A graph will be implemented as a dictionary, where the keys are the vertice values and the values are arrays that list al of the vertices that the key vertice is connected to.

# Example: See graph1.gif in this directory. It will be implemented as
graph1 = {
            'A': ['C', 'D'],
            'B': ['D', 'F'],
            'C': ['A', 'G'],
            'D': ['A', 'B', 'E', 'H'],
            'E': ['D', 'G', 'H'],
            'F': ['B', 'H'],
            'G': ['C', 'E'],
            'H': ['D', 'E', 'F'],
            'J': ['I'],
            'I': ['J', 'K'],
            'K': ['I']
         }

#
