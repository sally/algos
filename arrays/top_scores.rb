# Source: Interview Cake

# You rank players in the game from highest to lowest score. So far you're using an algorithm that sorts in `O(Nlog(N))` time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.
#
# Write a function that takes:
#
# * an array of unsorted_scores
# * the `highest_possible_score` in the game
# * and returns a sorted array of scores in less than `O(Nlog(N))` time.
#
# For example:
#
# ```ruby
# unsorted_scores = [37, 89, 41, 65, 91, 53]
# HIGHEST_POSSIBLE_SCORE = 100
#
# sort_scores(unsorted_scores, HIGHEST_POSSIBLE_SCORE)
# # returns [37, 41, 53, 65, 89, 91]
# ```
#
# We’re defining `n` as the number of `unsorted_scores` because we’re expecting the number of players to keep climbing.
#
# And we'll treat `highest_possible_score` as a constant instead of factoring it into our big O time and space costs, because the highest possible score isn’t going to change.

## pseudocode

# call the highest_possible_score M
# since we know the highest score possible, can make an array of length M, with entries initialized at 0
# as we iterate through given array, update the iteratee's corresponding index in the histogram array, keeping track of occurrences
# iterate through histogram array, making new array of numbers based on indices which keep track of occurrences of the numbers

def sort_scores(unsorted_scores, highest_possible_score)
  histogram_array = [0] * highest_possible_score

  unsorted_scores.each do |score|
    histogram_array[score - 1] += 1
  end

  sorted_scores = []

  histogram_array.each_with_index do |score_occurrences, index|
    score_occurrences.times do |occurrences|
      sorted_scores << index + 1
    end
  end

  sorted_scores
end

# driver code

unsorted_scores = [37, 89, 41, 65, 91, 53]
highest_possible_score = 100

p sort_scores(unsorted_scores, highest_possible_score)
# returns [37, 41, 53, 65, 89, 91]

# big o analysis

# time: O(n)
# space: O(n)
