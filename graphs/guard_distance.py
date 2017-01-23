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
