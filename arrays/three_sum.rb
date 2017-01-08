# Source: LiveRamp Interview

# Given a sorted array, find three values in the array that sum to a given number.
#
# e.g. Given [1,2,3,4,5], can you find three values that sum to 10? If so, what values are they? The solution must be better than O(N^3).

# pseudocode:
# for k in array:
  # initialize two pointers, say i and j
  # i starts at k's index + 1, j starts at array's length - 1
  # while i < j:
    # if sum of k, array[i] and array[j] are smaller than sum, advance i
    # if sum of k, array[i] and array[j] are larger tham the sum, de-advance j
    # if sum of k, array[i] and array[j] equal sum, then return the three numbers
# else, return false

def three_sum(array, target_num)
  for k in (0...(array.length-2)) do
    i = k + 1
    j = array.length - 1

    while i < j
      if array[k] + array[i] + array[j] == target_num
        return "A possible combination is #{array[k]} + #{array[i]} + #{array[j]} = #{target_num}."
      elsif array[k] + array[i] + array[j] < target_num
        i += 1
      elsif array[k] + array[i] + array[j] > target_num
        j -= 1
      end
    end
  end

  false
end

p three_sum([1,2,3,4,5], 10)

# big o analysis
# time: O(N^2)
# space: O(1)
