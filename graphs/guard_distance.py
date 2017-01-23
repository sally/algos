# Given a matrix that is filled with 'O', 'G', and 'W' where 'O' represents open space, 'G' represents guards, and 'W' represents walls in a bank, replace all of the 'O's in a matrix with their shortest distance from a guard, without being able to go through any walls.

# Also, replace the guards with 0 and walls with -1 in the output matrix.

# Expected time complexity is O(MN) for an M*N matrix.

# Examples:
# O -> open space
# G -> guard
# W -> wall

# Input:
#   O  O  O  O  G
#   O  W  W  O  O
#   O  O  O  W  O
#   G  W  W  W  O
#   O  O  O  O  G
#
# Output:
#   3  3  2  1  0
#   2 -1 -1  2  1
#   1  2  3 -1  2
#   0 -1 -1 -1  1
#   1  2  2  1  0

# Idea: do a breadth first search with guard tiles queued first
    # until the queue is empty:
        # dequeue, get node and distance from guard
        # replace coordinate in matrix with distance from guard
        # for all adjacent nodes:
            # if adjacent node is not already visited, and it's not a wall:
                # enqueue it with node info and distance + 1

from collections import deque

def guard_distances(matrix):

    output = [[-1 for j in range(len(matrix[0]))] for i in range(len(matrix))]

    # If going diagonal counts as one step:
    # x_directions = [-1, 0, 1, -1, 1, -1, 0, 1]
    # y_directions = [1, 1, 1, 0, 0, -1, -1, -1]

    x_directions = [0, -1, 1, 0]
    y_directions = [-1, 0, 0, 1]

    def is_safe(x, y):
        return x >= 0 and y >= 0 and x < len(matrix[0]) and y < len(matrix) and output[x][y] == -1 and matrix[x][y] != "W" and (x,y) not in { (item[0], item[1]) for item in queue }

    queue = deque([])

    for i in range(len(matrix)):
        for j in range(len(matrix[0])):
            if matrix[i][j] == 'G':
                queue.append( (i, j, 0) )

    print('initial queue is', queue)

    while queue:
        x,y,distance = queue.popleft()

        output[x][y] = distance

        print(x, y, distance)
        print(output)

        for k in range(len(x_directions)):
            if is_safe(x + x_directions[k], y + y_directions[k]):
                queue.append((x + x_directions[k], y + y_directions[k], distance + 1))

        print(queue)

    return output

bank = [
   ['O', 'O', 'O', 'O', 'G'],
   ['O', 'W', 'W', 'O', 'O'],
   ['O', 'O', 'O', 'W', 'O'],
   ['G', 'W', 'W', 'W', 'O'],
   ['O', 'O', 'O', 'O', 'G']
        ]

print(guard_distances(bank))
