# Source: HackerRank (https://www.hackerrank.com/challenges/connected-cell-in-a-grid)

# Given an `n*m` matrix, find and print the number of cells in the largest region in the matrix, where region is defined as given in the source link. Note that there may be more than one region in the matrix.

# pseudocode

# idea: iterate through matrix, when you run into a 1, do a depth first search from that coordinate to find all 1s surrounding it - keep count of the ones that are visited - mark those as visited

# initialize matrix of same dimensions as input matrix to keep track of "visited/unvisited" coordinates

# begin traversing array, row by row:
  # if encountered 1 that is NOT visited, do DFS for all 1s around it that make up an island
# helper functions:
  # check whether a coordinate should be added to the stack of coordinates for DFS
  # a method that provides all possible directions to check while DFSing (8 directions)

# HELPER FUNCTION TO CHECK IF A GIVEN CELL CAN BE INCLUDED IN OUR DFS FOR 1s
def is_safe?(matrix, row, column, visited)
  return row >= 0
      && row < matrix.length
      && column >= 0
      && column < matrix.first.length
      && matrix[row][column] == 1
      && !visited[row][column]
end

# UTILITY FUNCTION TO DO DFS FOR A 2D BOOLEAN MATRIX: Only considers the 8 neighbors as adjacent vertices
def dfs(matrix, row, column, visited)
  island_size = 1

  row_directions    = [-1, -1, -1,  0,  0,  1, 1, 1]
  column_directions = [-1,  0,  1, -1,  1, -1, 0, 1]

  visited[row][column] = true

  for n in 0...8 do
    if is_safe?(matrix, row + row_directions[n], column + column_directions[n], visited)
      dfs(matrix, row + row_directions[n], column + column_directions[n], visited)
      island_size += 1
    end
  end

  island_size
end

# main function that returns biggest island's size
def largest_region(matrix)
  raise "Please enter a non-empty, valid matrix" if matrix.empty?

  rows = matrix.length
  columns = matrix.first.length

  largest_region_size = 0

  visited = Array.new(rows, Array.new(columns, false))

  for i in 0...rows do
    for j in 0...columns do
      if matrix[i][j] && !visited[i][j]
        region_size = dfs(matrix, i, j, visited)
        largest_region_size = [largest_region_size, region_size].max
      end
    end
  end

  largest_region_size
end
