# Source: HackerRank

# Merge two sorted arrays in place, e.g.

# if array1 = [1,2,2]
# and array2 = [2,3,5, nil, nil, nil]

# Then return array2 modified in place as [1,2,2,2,3,5]

def merge_sorted_in_place(array1, array2):
    p1 = len(array1) - 1
    p2 = len(array1) - 1

    insert_point = len(array2) - 1

    while insert_point >= 0:
        if p1 >= 0 and p2 >= 0:
            if array1[p1] >= array2[p2]:
                array2[insert_point] = array1[p1]
                p1 -= 1
                insert_point -= 1
            else:
                array2[insert_point] = array2[p2]
                p2 -= 1
                insert_point -= 1
        elif p1 >= 0:
            array2[insert_point] = array1[p1]
            p1 -= 1
            insert_point -= 1
        else:
            array2[insert_point] = array2[p2]
            p2 -= 1
            insert_point -= 1

    return array2

print(merge_sorted_in_place([1,2,2], [2,3,5,None,None,None]))
