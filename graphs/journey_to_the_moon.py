# HackerRank https://www.hackerrank.com/challenges/journey-to-the-moon

# The member states of the UN are planning to send 2 people to the Moon. But there is a problem: In line with their principles of global unity, they want to pair astronauts of 2 different countries.
# There are N trained astronauts numbered from 0 to N-1. But those in charge of the mission did not receieve inormation about the citizenship of each astronaut. The only information they have is that some particular pairs of astronauts belong to the same country.

# Your task is to compute in how many ways they can pick a pair of astronauts belonging to different countries. Assume that you are provided enough pairs to let you identify the groups of astronauts even though you might not know their country directly. For instance, if 1,2,3 are astronauts from the same country, it is sufficient to mention that (1,2) and (2,3) are pairs of astronauts from the same country without providing information about a third pair (1,3).

# Example:

# Input: [(0,1), (2,3)]
# Output: 4

# Explanation: Persons numbered 0 and 1 belong to the same country, and those numbered 2 and 3 belong to the same country. So the UN can choose one person out of 0 and 1, and another person out of 2 and 3. Hence, the number of ways of choosing a pair of astronauts is 4.

# Idea:
    # Build a graph represented as such. Keys are vertices, values are vertices that the key vertex has an edge to.
    # Iterate through the input array of pair tuples, adding edges for the pairs.

    # Do a breadth first search through the graph. We keep track of the connected components.

from collections import defaultdict

class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

    def add_edge(self, v1, v2):
        self.graph[v1].append(v2)
