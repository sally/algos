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
from collections import deque

class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

    def add_edge(self, v1, v2):
        self.graph[v1].append(v2)

    def build_graph(self, pairs):
        for pair in pairs:
            self.add_edge(pair[0], pair[1])
            self.add_edge(pair[1], pair[0])

    def get_connected_components(self):
        self.visited = { vertex: False for vertex in self.graph }
        self.connected_components = []

        for vertex in self.graph:
            if not self.visited[vertex]:
                self.bfs(vertex)

        return self.connected_components

    def bfs(self, vertex):
        component = []
        queue = deque([vertex])

        while queue:
            vertex = queue.popleft()
            self.visited[vertex] = True
            component.append(vertex)
            for adjacent_vertex in self.graph[vertex]:
                if not self.visited[adjacent_vertex]:
                    queue.append(adjacent_vertex)

        self.connected_components.append(component)

    def get_combinations(self):
        self.get_connected_components()

        combinations = 0

        for k, component in enumerate(self.connected_components):
            combinations += len(component) * sum(map(len, self.connected_components[k+1:]))

        return combinations


astronauts = Graph()
astronauts.build_graph([(0,1), (2,3)])
print(astronauts.graph)
# => defaultdict(<type 'list'>, {0: [1], 1: [0], 2: [3], 3: [2]})
print(astronauts.get_connected_components())
# => [[0, 1], [2, 3]]
print(astronauts.get_combinations())
# => 4
