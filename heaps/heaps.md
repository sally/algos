# Heaps

## Definition

A **heap** or a **max heap** is a binary tree that satisfies the following properties:

1. it is complete

  i.e. a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible

2. the data item stored in each node is greater than or equal to the data items stored in its children

  this is called the **heap-order property**

A **min heap** is a binary tree that satisfies the following properties:

1. it is complete

2. the data item stored in each node is less than or equal to the data items stored in its children

## Notes

* [About indices in array version of heap implementation](http://stackoverflow.com/questions/22900388/why-in-a-heap-implemented-by-array-the-index-0-is-left-unused)

|             | Root at 0 | Root at 1 |
|-------------|-----------|----------|
| Left child  | i*2 + 1   | i*2      |
| Right child | i*2 + 2   | i*2 + 1  |
| Parent      | (i-1) / 2 | i / 2    |
