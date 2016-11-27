def merge_sort(arr)

  if arr.length <= 1
    arr
  else
    mid = (arr.length/2).floor
    left = merge_sort(arr[0..mid-1])
    right = merge_sort(arr[mid..-1])
    merge(left, right)
  end

end

def merge(left, right)

  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..-1], right)
  else
    [right.first] + merge(left, right[1..-1])
  end

end
