# Consider a staircase of size :
#
#    #
#   ##
#  ###
# ####
# Observe that its base and height are both equal to , and the image is drawn using # symbols and spaces. The last line is not preceded by any spaces.
#
# Write a program that prints a staircase of size .
#
# Input Format
#
# A single integer, , denoting the size of the staircase.
#
# Output Format
#
# Print a staircase of size  using # symbols and spaces.

# Note: The last line must have  spaces in it.
#
# Sample Input
#
# 6
# Sample Output
#
#      #
#     ##
#    ###
#   ####
#  #####
# ######

########################

# Call the input number n
# Iterate "n" number of times, call the counter k:
  # For each line, print n - k - 1 spaces, and k + 1 many hashtags

def staircase(n)
  stairs = ""

  n.times do |index|
    stairs << " " * (n - index - 1) + "#" * (index + 1) + "\n"
  end

  puts stairs
end

p staircase(6)
