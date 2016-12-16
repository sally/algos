# HR: Diagonal Difference

# Given a square matrix NxN, calculate the absolute difference between the sums of its diagonals.

# Example:

# 3,
# [[11, 2, 4],
# [4, 5, 6],
# [10, 8, -12]]

# Output: 15

#################################

# Since we are given the dimension of the NxN matrix as the first argument, we can get the main diagonal by starting at the first entry and moving down diagonally to the right N-1 times
# We can get the antidiagonal by starting at the first row's last entry and moving down diagonally to the left N-1 times
# Note that to access the "down diagonal right" element, we have that we add 1 to the column index and 1 to the row index
# Note that to access the "down diagonal left" element, we have that we add 1 to the row index and subtract 1 from the column index

# Once we have calculated the diagonals, use .abs to return the absolute difference between the two

# Time complexity analysis: N steps to traverse and get the main diagonal, N steps to traverse and get the antidiagonal. O(N) where N is the number of rows/columns in the square matrix
# Space complexity analysis: O(1), since we store the main diagonal sum, antidiagonal sum only - no data structures whose size depends on the data structure given

def diagonal_difference(n, matrix)
  main_diagonal_sum = 0
  anti_diagonal_sum = 0

  n.times do |index|
    main_diagonal_sum += matrix[index][index]
  end

  n.times do |index|
    anti_diagonal_sum += matrix[n - index][index]
  end

  return [main_diagonal_sum - anti_diagonal_sum, anti_diagonal_sum - main_diagonal_sum].max
end
