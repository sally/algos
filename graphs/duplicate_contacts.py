# Reference: http://www.geeksforgeeks.org/find-same-contacts-in-a-list-of-contacts/

# Given a list of contacts containing username, email, and phone number in any order, identify the same contacts (i.e. the same peson having many different contact entries) and output the same contacts together.

# Notes:
    # (1) A contact can store its three fields in any order, i.e. phone number can appear before username or username can appear before phone number.
    # (2) Two contacts are the same if they have either the same username or email or phone number.

# Example:

# Input:

contacts = [
       {"Gaurav", "gaurav@gmail.com", "gaurav@gfgQA.com"},
       { "Lucky", "lucky@gmail.com", "+1234567"},
       { "gaurav123", "+5412312", "gaurav123@skype.com"},
       { "gaurav1993", "+5412312", "gaurav@gfgQA.com"}
            ]

# Output:

"0 2 3"

# Explanation:

# contacts[2] is the same as contact[3] because they both have the same phone number.
# contact[0] is the same as contact[3] because they both have same email address.
# therefore, contact 0 and 2 are also the same.

# Create a graph from the contacts list, represented by a dict.
    # Keys are indices of the contact
    # Values are contact indices that the key index has "an edge" to

    # Two contact indices have an edge to each other if and only if they have one of the same: phone #, email, or username

# Problem boils down to finding number of connected components in a graph
    # Iterate through the keys of the graph, doing a DFS for items that are in the same "component"
        # we keep track of nodes that are already visited
        # once DFS is finished, we add 1 to number of components and print the components
    # @ the end, return the number of components

# Step 1: Make dictionary out of the contact list.
    # Iterate through the sets. For each set:
        # Insert the set's index and an empty array into the dict to return
        # Construct the array that makes up the "rest" of the sets
        # Iterate through the rest, and take intersections.
            # If at any point intersection is non-empty, then append the rest's index into the dict value

# Step 2: Detect connected components and return them

def build_graph(contacts):
    graph = {index: set() for index in range(len(contacts))}

    for i, contact in enumerate(contacts):
        for m in graph[i]:
            for n in graph[i]:
                if m != n:
                    graph[m].add(n)

        rest = contacts[i+1:]

        for j, other_contact in enumerate(rest):
            if contact & other_contact:
                graph[i].add(j + i + 1)
                graph[j+i+1].add(i)

    return graph

print(build_graph(contacts))
# => Should return {0: [2,3], 1: [], 2: [0,3], 3: [0,2]}

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

print(connected_components(build_graph(contacts)))

contacts2 = [
             {"Gaurav", "gaurav@gmail.com", "gaurav@gfgQA.com"},
             {"Lucky", "lucky@gmail.com", "+1234567"},
             {"gaurav123", "+5412312", "gaurav123@skype.com"},
             {"gaurav1993", "+5412312", "gaurav@gfgQA.com"},
             {"raja", "+2231210", "raja@gfg.com"},
             {"bahubali", "+878312", "raja"},
             {"gaurav1993", "+1234568", "g@aol.com"}
            ]

print(connected_components(build_graph(contacts2)))
