# LeetCode: Island Perimeter

# You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

# Example:

# [[0,1,0,0],
#  [1,1,1,0],
#  [0,1,0,0],
#  [1,1,0,0]]
#
# Answer: 16

##################################

# Initial thoughts:
# Go through example given:
  # At (0,0): Is a 0, do nothing
  # At (0,1): Is a 1
    # Check left: Is a 0, add 1 to perimeter
    # Check up: Is nil, add 1 to perim
    # Check right: Is 0, add 1 to perimeter
    # Check down: Is 1, do nothing
  # At (0,2): Is a 0, do nothing
  # At (0,3): Is a 0, do nothing
  # At (1,0): Is a 1
    # Check left: Is nil, add 1 to perim
    # Check up: Is 0, add 1 to perim
    # Check right: Is 1, do nothing
    # Check down: Is 0, add 1 to perim
  # At (1,1): Is a 1
    # Check left: Is 1, do nothing
    # Check up: Is 1, do nothing
    # Check right: Is 1, do nothing
    # Check down: Is 1, do nothing
  # ...

def island_perimeter(grid)
  perimeter = 0
  num_rows = grid.length
  num_columns = grid.first.length

  grid.each_with_index do |row, row_index|
    row.each_with_index do |entry, column_index|
      if entry == 1
        perimeter += 1 if column_index == 0 || [0, nil].include?(grid[row_index][column_index - 1])
        perimeter += 1 if row_index == 0 || [0, nil].include?(grid[row_index - 1][column_index])
        perimeter += 1 if column_index == (num_columns - 1) || [0, nil].include?(grid[row_index][column_index + 1])
        perimeter += 1 if row_index == (num_rows - 1) || [0, nil].include?(grid[row_index + 1][column_index])
      end
    end
  end

  perimeter
end

grid =
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

grid2 =
[ [1,1],
  [1,1] ]
grid3 =
[ [0,0],
  [0,0] ]

p island_perimeter(grid)
p island_perimeter(grid2)
p island_perimeter(grid3)
