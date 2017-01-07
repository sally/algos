# Source: [Leetcode](https://leetcode.com/problems/pascals-triangle/)

# Given `numRows`, generate the first `numRows` of Pascal's triangle.
#
# For example, given `numRows = 5`,
#
# Return
#
# ```
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]
# ```

# pseudocode

# let N = input #
# let A = [] (pascal's triangle array to return)
# let C = 0 (for counter)

# until C = N:
  # if A is empty:
    # push [1] to A
    # C = C + 1
  # else:
    # let pre-layer be the element A[C-1]
    # let new-layer = [] (array to push into A)
    # iterate through pre-layer:
      # look at iteratee's index
        # if it is 0:
          # push 1 into new-layer
        # if it is pre-layer's length - 1:
          # push 1 into new-layer
        # else:
          # push sum of iteratee and element in pre-layer preceding iteratee
    # push new-layer into A
    # C = C + 1

# return A

def pascal(n)
  triangle_array = []
  counter = 0

  until counter == n
    if triangle_array.empty?
      triangle_array.push([1])
      counter += 1
    else
      pre_layer = triangle_array[counter - 1]
      new_layer = []

      pre_layer.each_with_index do |number, index|
        if index == 0
          new_layer.push(1)
        else
          previous_number = pre_layer[index - 1]
          new_layer.push(number + previous_number)
        end
      end

      new_layer.push(1)
      triangle_array.push(new_layer)
      counter += 1
    end
  end

  triangle_array
end

p pascal(4)

p pascal(10)

# big o analysis
# time and space: O(N!)?
  # reasoning: the resulting array to return is of size N!
  # operations needed to build the resulting array is N!
