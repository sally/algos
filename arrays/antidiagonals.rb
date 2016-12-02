# Given an MxN matrix, write code which prints out the diagonals (from upper right to lower left) of the matrix.
# In this example where M = 3, N = 4:
# [[9 3 2]
#  [8 6 1]
#  [5 5 6]
#  [1 2 8]]


# Your code should print out
# 9
# 3 8
# 2 6 5
# 1 5 1
# 6 2
# 8


matrix = [[9, 3, 2],
          [8, 6, 1],
          [5, 5, 6],
          [1, 2, 8]]

print_diagonal = lambda do |current_column, current_row|
  if !current_column.zero? || current_row == (num_rows - 1)
      until current_column.zero? || current_row == (num_rows - 1)
          print matrix[current_row + 1][current_column - 1]
          current_column -= 1
          current_row += 1
      end
  end
end

def print_diagonals(matrix)

   num_rows = matrix.length
   num_columns = matrix[0].length

   first_row = matrix[0]
   last_column = matrix.map do |row|
     row[-1]
   end

  first_row.each_with_index do |element, current_column|
        current_row = 0
        print element

        if !current_column.zero? || current_row == (num_rows - 1)
            until current_column.zero? || current_row == (num_rows - 1)
                print matrix[current_row + 1][current_column - 1]
                current_column -= 1
                current_row += 1
            end
        end
    end

    last_column.each_with_index do |element, current_row|
        next if current_row.zero?

        current_column = num_columns - 1
        print element

        if !current_column.zero? || current_row == (num_rows - 1)
            until current_column.zero? || current_row == (num_rows - 1)
                print matrix[current_row + 1][current_column - 1]
                current_column -= 1
                current_row += 1
            end
        end
    end
end



p print_diagonals(matrix)
