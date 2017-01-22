# An algorithm to detect a cycle in an undirected graph: Given an undirected graph, we wish to check if there is a cycle.

# Example: See graph2 in this directory. It will be implemented as

graph2 = {
            1: [2,0],
            2: [1,0],
            0: [1,2,3],
            3: [0,4],
            4: [3]
         }

# Then since there is a cycle 1->2->0->1..., our function should return true, whereas for this other example:

non_cyclic = {
                1: [2]
                2: [1,3]
                3: [2]
             }

# Is not cyclic (the above is the graph 1 - 2 - 3).

# We want to write a function detect_cycle that accepts a graph and returns True if there is a cycle or return False if there does not exist a cycle.
# To be specific: For any visited vertex 'v', if there is an adjacent 'u' that is already visited and 'u' is not a parent of 'v', then there is a cycle in the graph.
