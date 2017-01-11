# CTCI: Given a list_of_ints, find the highest_product you can get from three of the integers.
#
# The input list_of_ints will always have at least three integers.

#####################

# O(N) solution. Keep track of the highest product of 2, lowest product of 2, highest number, lowest number, and highest product of 3 so far.
# Keeping track of the lowest product of 2 and the lowest number account for if the highest product of three involves negative numbers

# idea:
  # initialize highest as the maximum of the first two numbers
  # initialize lowest as the minimum of the first two numbers
  # initialize product of highest 2 as the product of the first 2 numbers
  # initialize product of lowest 2 as the product of the first 2 numbers
  # initialize highest product of 3 as the product of the first 3 numbers

  # for k in array:
    # update highest product of 3
    # update highest product of 2
    # update lowest product of 2
    # update highest
    # update lowest

  # return highest product of 3

def highest_product_of_three(array)
  raise "Please enter an array with at least 3 elements." if array.length < 3

  highest_product_of_2 = array[0] * array[1]
  lowest_product_of_2 = array[0] * array[1]

  highest = [array[0], array[1]].max
  lowest = [array[0], array[1]].max

  highest_product_of_3 = array[0] * array[1] * array[2]

  for k in 2...array.length do
    highest_product_of_3 = [
                            highest_product_of_3,
                            highest_product_of_2 * array[k],
                            lowest_product_of_2 * array[k]
                            ].max


    highest_product_of_2 = [
                            highest_product_of_2,
                            array[k] * highest,
                            array[k] * lowest
                            ].max

    lowest_product_of_2 = [
                            lowest_product_of_2,
                            array[k] * highest,
                            array[k] * lowest
                          ].min

    highest = [highest, array[k]].max

    lowest = [lowest, array[k]].min
  end

  highest_product_of_3
end

array1 = [-10, -10, 1, 3, 2]

p highest_product_of_three(array1)
# => returns 300
