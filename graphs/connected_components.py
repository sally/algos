# Reference: http://quiz.geeksforgeeks.org/connected-components-in-an-undirected-graph/

# In graph theory, a connected component (or just component) of an undirected graph is a subgraph in which any two verties are connected to each other by paths, and which is connected to no additional vertices in the supergraph. - Wikipedia

# Given an undirected graph, we print all connected components line by line. For example, consider graph3.gif in this directory, represented in the following way by this dictionary:

graph3 = {
            1: [0,2],
            0: [1],
            2: [1],
            3: [4],
            4: [3]
         }

# Then the output should be:
"0 1 2"
"3 4"
2

# This is because "0 1 2" make up one component of the graph, and "3 4" the other, which means that there are 2 connected components.

# Pseudocode:
    # Initialize a dictionary called "visited" whose keys are the vertices, and whose values are False or True depending on whether a vertex has been visited or not
    # Initialize a "component_count" integer type which keeps track of the number of components
    # Initialize a "component" string type which keeps track of which vertices are in each separate component

    # For each vertex in the graph, do the following:
        # If it is not visited, then run a depth first search on the graph (called with the graph, the vertex, the visited dict, and the component string)

        # Within the depth first search:
            # Mark the vertex as visited
            # Push the vertex's value into the component string

            # For each adjacent node,
                # If the adjacent node is not visited, then run dfs on it with the graph, the adjacent node, the visited dict, and the component string

        # Print the component string
        # Reset the component string
        # Add one to the component count

    # At the very end, return the component count

def connected_components(graph):
    visited = {vertex: False for vertex in graph}
    component = ''
    components_count = 0

    def dfs(graph, vertex, visited):
        nonlocal component
        visited[vertex] = True
        component += str(vertex) + ' '

        for adjacent_vertex in graph[vertex]:
            if not visited[adjacent_vertex]:
                dfs(graph, adjacent_vertex, visited)

    for vertex in graph:
        if not visited[vertex]:
            dfs(graph, vertex, visited)
            print(component)
            component = ''
            components_count += 1

    return components_count

print(connected_components(graph3))
