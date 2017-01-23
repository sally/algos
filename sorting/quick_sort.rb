require 'pry-byebug'

# Quick sort algorithm:

# Pick a random element in the array, call it the pivot
# Put every element less than the pivot to the left, and put every element more than the pivot on the right
# For the left-partition and the right-partition, run quick sort on that half.
# BASE CASE: The array is only one element.

# Example: [7,4,1,3,2,5]
# Suppose that the "pivot" is randomized to be 3. Note that the pivot ID is 3.
# We iterate through and place the elements where they beong, as stated above:
  # Since 7 > 3, we move 7 to the end:
    # [4,1,3,2,5,7]
    # Note that the pivot ID becomes 2
  # Since 4 > 3, we move 4 to the end
    # [1,3,2,5,7,4]
    # Note that the pivot ID becomes 1
  # Since 1 < 3 and its ID in the array is smaller than 1, we keep 1 where it is
  # Since 2 < 3, we move 2 to the front
    # [2,1,3,5,7,4]
    # Note that the pivot ID becomes 2
  # Since 5 > 3, and its ID in the array is bigger than 2, we keep 5 where it is

# We're done iterating, so we run the process again on the two partitions made: [2,1] and [5,7,4] ...

# Note: Logistics may make it not possible for us to iterate neatly through the array if we keep the pivot in, so we can iterate it without:
  # Suppose we had the same array, [7,4,1,3,2,5], with pivot randomized to be index 3
  # We iterate the length of [7,4,1,2,5], noting that the pivot index is 3
    # Case: num > pivot
        # Subcase: idx < pivotIdx
          # move num to right, decrease pivot by 1
        # Subcase: idx > pivotIdx
          # keep num there
        # Subcase: idx = pivotIdx
          # decrease pivotIdx by 1
    # Case: num < pivot
      # Subcase: idx > pivotIdx
        # move num to left, increase pivot by 1
      # Subcase: idx < pivotIdx
        # keep num there
      # Subcase: idx = pivotIdx
        # increase pivotIdx by 1
# This tells us that some of our subcases can be collapsed
# We're ready to try!


# def quick_sort(array)
#   if !array
#     []
#   elsif array.length == 1
#     return array
#   else
#     pivot_id = rand(array.length)
#     pivot = array[pivot_id]
#
#     p "The pivot is #{pivot} which is at id #{pivot_id}"
#
#     array_sans_pivot = array - [pivot]
#
#     p "Here is the array without the pivot point: #{array}"
#
#     array_sans_pivot.length.times do |i|
#       if array[i] < pivot
#         if i < pivot_id
#           next
#         else
#           array.unshift(array.delete_at(i))
#           pivot_id += 1 if pivot_id != array.length
#         end
#       else
#         if i > pivot_id
#           next
#         else
#           array.push(array.delete_at(i))
#           pivot_id -= 1 if pivot_id != 0
#         end
#       end
#     end
#
#     p "Here is the result after shuffling elements around in the array: #{array}"
#
#     p "Here's the pivot id: #{pivot_id}"
#
#     p "Here's what we're trying to run the two different quick_sorts on: #{array[0..pivot_id]} and #{array[pivot_id+1..-1]}"
#
#     return quick_sort(array[0..pivot_id]) + [pivot] + quick_sort(array[pivot_id+1..-1])
#   end
# end
#
# p quick_sort([7,4,1,3,2,5])

# Erroring because we are modifying the array in place, which means indices get shuffled around and certain number never get examined.
# Solution: Write a helper function that takes in an array and a starting index to do the comparison with the pivot

# The only case that we increase the current ID is not moving anything, or  moving something up front

def quick_sort_in_place(array)
  if array.length <= 1
    array
  else
    # pivot_id = rand(array.length)
    pivot_id = rand(array.length)
    p "We work with pivot_id #{pivot_id} which is #{array[pivot_id]}"
    current_id = 0

    placer = lambda do |array|
      if array[current_id] < array[pivot_id]
        if current_id < pivot_id
          current_id += 1
        else
          array.unshift(array.delete_at(current_id))
          pivot_id += 1
          current_id += 1
        end
      elsif array[current_id] > array[pivot_id]
        if current_id > pivot_id
          current_id += 1
        else
          array.push(array.delete_at(current_id))
          pivot_id -= 1
        end
      else
        current_id += 1
      end
    end # ends placer

    array.length.times do
      placer.call(array)
    end

    p "We call quick sort again on #{array[0...pivot_id]} + #{[array[pivot_id]]} + #{array[pivot_id+1..-1]}"

    return quick_sort_in_place(array[0...pivot_id]) + [array[pivot_id]] + quick_sort_in_place(array[pivot_id+1..-1])
  end # ends checking for array length
end # ends def

p quick_sort_in_place([7,4,1,3,2,5])

p quick_sort_in_place([])

p quick_sort_in_place([4])

# Implementation for quick sort non-in-place

def quick_sort_non_ip(array) #takes an array of integers as an argument
  if array.length <= 1
    return array
  else
    pivot = array.sample
    array.delete_at(array.index(pivot)) # remove the pivot
    #puts "Picked pivot of: #{pivot}"
    less = []
    greater = []

    array.each do |x|
      if x <= pivot
        less << x
      else
        greater << x
      end
    end

    sorted_array = []
    sorted_array << quick_sort_non_ip(less)
    sorted_array << pivot
    sorted_array << quick_sort_non_ip(greater)

    # using Array.flatten to remove subarrays
    sorted_array.flatten!
  end
end

p quick_sort_non_ip([7,4,1,3,2,5])

p quick_sort_non_ip([])

p quick_sort_non_ip([4])
