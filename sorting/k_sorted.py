# Reference: http://www.geeksforgeeks.org/nearly-sorted-algorithm/

# Given an array of elements, where each element is at most k away from its target position, devise an algorithm that sorts in O(Nlog(K)) time.

# Example: [2, 6, 3, 12, 56, 8], k = 2
# Output: [2, 3, 6, 8, 12, 56]

# Idea:
    # Make a heap of size k+1 from the first k+1 elements
    # for i in len(array):
        # extract from heap and put it at position k of output array
        # add element at position i + k + 2 to heap

# Temporary work around for relative import for Python
from heap import MinHeap

def sort_k_sorted(array,k):
    sorted = []
    min_heap = MinHeap(array[:k+2])

    for i in range(len(array)):
        print(min_heap.heap)
        sorted.append(min_heap.extract_min())
        if i+k+2 < len(array):
            min_heap.insert(array[i+k+2])

    return sorted

print(sort_k_sorted([2, 6, 3, 12, 56, 8], 2))
