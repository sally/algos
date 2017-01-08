# Source: InterviewCake

# Write a function for doing an in-place shuffle of an array.
#
# The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.
#
# Assume that you have a function `get_random(floor, ceiling)` for getting a random integer that is >= floor and <= ceiling.

# pseudocode

# iterate over array to shuffle:
# for each iteratee, calculate x = get_random(iteratee_index, length - 1)
  # swap the iteratee with item at index x

def in_place_shuffle(array)
  array.each_with_index do |element, index|
    switch_index = rand(index..(array.length - 1))

    array[index], array[switch_index] = array[switch_index], element
  end

  array
end

# driver code

array1 = [1,2,3,4,5,6,7,8,9,10]
p in_place_shuffle(array1)

# big o analysis
# time: O(N)
# space: O(1)
