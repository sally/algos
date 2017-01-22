# An algorithm to find whether or not a path exists between two vertices A and B

# A graph will be implemented as a dictionary, where the keys are the vertex values and the values are lists that list al of the vertices that the key vertex is connected to.

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

# We want to write a function find_path that accepts a graph and two vertices to either return False if there exists no path, or a list containing one path if there exists a path.

# Idea: Do a breadth first search algorithm, starting from node1. Keep track of "node" and "previous" information in the queue
    # Whenever adding a node to the queue, we must make sure that
        # (0) if it's equal to node2, then return true
        # (1) it's not already 'visited'
        # (2) it's not already in the queue

from collections import deque

def find_path(graph, v1, v2):
    # Create a visisted_from dictionary, that keeps track of whether a vertex was visited or not.
        # If it was visited, then the value is its source node
        # If it was not visited, then the value is False
    visited_from = { vertex : False for vertex in graph if vertex != v1}

    # Queue for keeping track of which vertex to check next in breadth first search
    queue = deque([])

    # Initialize queue with the starting node
    for vertex in graph[v1]:
        # Elements of the queue look like [vertex, source_node]
        queue.append([vertex, v1])
        visited_from[vertex] = v1

    while queue:
        vertex, source = queue.popleft()

        if vertex == v2:
            path = [source, v2]
            while visited_from.get(source, False):
                path.insert(0, visited_from[source])
                source = visited_from[source]
            return path

        visited_from[vertex] = source


        for adjacent_vertex in graph[vertex]:
            if visited_from.get(adjacent_vertex, True):
                continue
            elif vertex in [ vertex_info[0] for vertex_info in queue ]:
                continue
            else:
                queue.append([adjacent_vertex, vertex])

    return False

print(find_path(graph1, 'A', 'H'))
# => ['A', 'D', 'H']

print(find_path(graph1, 'A', 'B'))
# => ['A', 'D', 'B']

print(find_path(graph1, 'H', 'C'))
# => ['H', 'D', 'A', 'C']

print(find_path(graph1, 'B', 'G'))
# => ['B', 'D', 'E', 'G']

print(find_path(graph1, 'C', 'F'))
# => ['C', 'A', 'D', 'B', 'F']

print(find_path(graph1, 'G', 'K'))
# => False
