# Source: LiveRamp Interview
#
# [Problem statement here](http://www.ardendertat.com/2011/10/17/programming-interview-questions-8-transform-word/)
#
# Given a source word, target word and an English dictionary, transform the source word to target by changing/adding/removing 1 character at a time, while all intermediate words being valid English words. Return the transformation chain which has the smallest number of intermediate words.
#
# e.g. If dictionary = ['cat', 'bat', 'bet', 'bed', 'at', 'ad', 'ed']
#
# Then transform_word('cat', 'bed') returns ['cat', 'bat', 'bet', 'bed'].
#
# If dictionary = ['cat, 'bat', 'bed', 'at', 'ad', 'ed']
#
# Then transform_word('cat', 'bed') returns ['cat', 'at', 'ad', 'ed', 'bed'].
#
# If dictionary = 'cat', 'bat', 'bed', 'ad', 'ed']
#
# Then transform_word('cat', 'bed') returns [].

# Idea:
    # Build Python dictionary from given dictionary array to represent graph
        # Keys will be 
