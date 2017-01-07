# Source: LiveRamp Interview

# for [1,2,6,5,5,8,9]:
# iterate through until find the first index of array which is greater than its next element (get min_index = 2)
# iterate backwards through the array until find the first index of array which is less than its previous element (get max_index = 3)
  # return 0 if we can't find these indices
# see if array[0...2] + sorted(array[2..3]) + array[4..-1] is sorted (it's not: we get [1,2,5,6,5,8,9])
  # if it is, then return max_index - min_index + 1
  # if it isn't, then see if there is a smaller element than array[min_index] in array[0...min_index]
    # if there is, then modify min_index and run program again
  # also see if there is a smaller element than array[max_index] in array[max_index+1..-1]
    # if there is, then modify max_index and run program again

def solution(a)
  min_index = nil
  max_index = nil

  a.each_with_index do |num, index|
    if index < a.length-1
      if num > a[index + 1]
        min_index = index
        break
      end
    end
  end

  reversed_array = a.reverse

  reversed_array.each_with_index do |num, index|
    if index < reversed_array.length-1
      if num < reversed_array[index + 1]
        max_index = a.length - index - 1
        break
      end
    end
  end

  if min_index.nil? && max_index.nil?
    return 0
  end

  until a.sort == a[0...min_index] + a[min_index..max_index].sort + a[max_index+1..-1]
    minimum_in_sub = a[min_index..max_index].sort.first
    maximum_in_sub = a[min_index..max_index].sort.last

    new_min_index = a[0...min_index].reverse.index(a[0...min_index].reverse.find{|n| n >= minimum_in_sub})

    if new_min_index
      min_index = min_index - new_min_index - 1
    end

    new_max_index = a[max_index+1..-1].index(a[max_index+1..-1].find{|n| n <= maximum_in_sub})

    if new_max_index
      max_index = max_index + new_max_index + 1
    end
  end

  max_index - min_index + 1
end
