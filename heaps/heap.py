class MinHeap:
    def __init__(self, array = []):
        if array:
            pass
        else:
            self.heap = []

    def percolate_up(self, index):
        while index > 0 and self.heap[index] < self.heap[(index-1) / 2]:
            self.heap[index], self.heap[(index-1) / 2] = self.heap[(index-1)/2], self.heap[index]
            index = (index-1)/2

    def percolate_down(self, index):
        while index < len(self.heap) and ((index*2 + 1 < len(self.heap) and self.heap[index] > self.heap[index*2 + 1]) or (index*2 + 2 < len(self.heap) and self.heap[index] > self.heap[index*2 + 2])):
            if index*2 + 1 < len(self.heap) and index*2 + 2 < len(self.heap):
                if self.heap[index*2 + 1] <= self.heap[index*2 + 2]:
                    replacement_index = index*2 + 1
                else:
                    replacement_index = index*2 + 2
            elif index*2 + 1 < len(self.heap) and index*2 + 2 >= len(self.heap):
                replacement_index = index*2 + 1
            else:
                replacement_index = index*2 + 2

            self.heap[index], self.heap[replacement_index] = self.heap[replacement_index], self.heap[index]
            index = replacement_index

    def insert(self, value):
        self.heap.append(value)
        self.percolate_up(len(self.heap) - 1)

    def extract_min(self):
        self.heap[0], self.heap[-1] = self.heap[-1], self.heap[0]

        return_value = self.pop(-1)

        self.percolate_down(0)

        return return_value

minheap = MinHeap()
minheap.insert(6)
minheap.insert(13)
minheap.insert(5)
minheap.insert(12)
minheap.insert(1)
minheap.insert(11)
print(minheap.heap)
