

def minimal_differences_bw_sorted(array1, array2)
  i = 0
  j = 0

  shortest_distance = Float::INFINITY

  while i < array1.length && j < array2.length
    if array1[i] == array2[j]
      return 0
    end

    shortest_distance = [shortest_distance, (array1[i] - array2[j]).abs].min

    if array1[i] < array2[j]
      i += 1
    else
      j += 1
    end
  end

  shortest_distance
end

array1 = [3, 27, 45, 68, 70, 81, 99]
array2 = [9, 16, 25, 35, 84]

p minimal_differences_bw_sorted(array1, array2)
# => minimum difference is 2 (27-25)

array3 = [12, 34, 57, 61, 69, 80]
array4 = [27, 39, 48, 51, 79]

p minimal_differences_bw_sorted(array3, array4)
# => minimum difference is 1 (80-79)
