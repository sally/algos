# Tree 1. Binary Search Tree, Balanced
#               25
#        /              \
#       15              50
#    /      \        /      \
#   10      22      35      70
#  /  \    /  \    /  \    /  \
# 4   12  18  24  31  44  66  90

root1 = BinaryTreeNode.new(25)
fifteen1       = root1.insert_left(15)
fifty1         = root1.insert_right(50)
ten1           = fifteen1.insert_left(10)
twenty_two1    = fifteen1.insert_right(22)
thirty_five1   = fifty1.insert_left(35)
seventy1       = fifty1.insert_right(70)
four1          = ten1.insert_left(4)
twelve1        = ten1.insert_right(12)
eighteen1      = twenty_two1.insert_left(18)
twenty_four1   = twenty_two1.insert_right(24)
thirty_one1    = thirty_five1.insert_left(31)
fourty_four1   = thirty_five1.insert_right(44)
sixty_six1     = seventy1.insert_left(66)
ninety1        = seventy1.insert_right(90)

# Tree 2. Invalid Binary Search Tree, Balanced
#       100
#      /   \
#    20     500
#   /  \     /
# 10   30   7

root2         = BinaryTreeNode.new(100)
twenty2       = root2.insert_left(20)
five_hundred2 = root2.insert_right(500)
ten2          = twenty2.insert_left(10)
thirty2       = twenty2.insert_right(30)
seven2        = five_hundred2.insert_left(7)

# Tree 3. Invalid Binary Search Tree, Not Balanced
#        5
#     /    \
#    3      8
#   /      / \
#  12     7   6
#           /
#          10
#         /  \
#        9    11
root3     = BinaryTreeNode.new(5)
three3    = root3.insert_left(3)
eight3    = root3.insert_right(8)
twelve3   = three3.insert_left(12)
seven3    = eight3.insert_left(7)
six3      = eight3.insert_right(6)
ten3      = six3.insert_left(10)
nine3     = ten3.insert_left(9)
eleven3   = ten3.insert_right(11)

# Tree 4. Binary Search Tree, Not Balanced
#        5
#     /    \
#    3      7
#          / \
#         6   8
#              \
#               10
#              /  \
#             9    12
root4     = BinaryTreeNode.new(5)
three4    = root4.insert_left(3)
seven4    = root4.insert_right(7)
six4      = seven4.insert_left(6)
eight4    = seven4.insert_right(8)
ten4      = eight4.insert_right(10)
nine4     = ten4.insert_left(9)
twelve4   = ten4.insert_right(12)
