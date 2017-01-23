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
        # Keys will be words, values will be lists containing the words that the key word has edit distance 1 from

    # Do Dijkstra's algorithm to find the shortest path from word1 to word2:
        # Initialize another dictionary to keep track of words that are already exhausted
            # Keys will be words, values will be either False or predecessor
        # Initialize a priority queue, where the members look like (word, predecessor, distance)
        # Insert (word1, None) to priority queue
        # Until priority queue is empty:
            # Pop the word info from the queue
            # For each adjacent word:

                # If it is word2:
                    # initialize path list as [predecessor]
                    # until exhausted[predecessor] is False,
                        # append to list
                    # return reversed list

                # If it's not exhausted:
                    # Check whether it is in the queue
                        # If it is AND the current distance+1 is less than distance in the queue
                            # Delete it from the queue and insert (adjacent word, word, distance+1) into the pqueue and percolate it up
                    # Otherwise, add it to the queue as (adjacent_word, word, distance+1)


def graphify_dictionary(dict):
    dict_graph = { word: [] for word in dict }

    for i, word in enumerate(dict):
        rest = dict[i+1:]

        for other_word in rest:
            if -1 <= len(word) - len(other_word) <= 1:
                # check if word can be gotten by deleting a letter from other_word
                if len(word) - len(other_word) == -1:
                    for j in range(len(word)):
                        if word[0:j] + word[j+1:] == other_word:
                            dict_graph[word].append(other_word)
                            dict_graph[other_word].append(word)
                # check if word can be gotten by adding a letter to other_word
                elif len(word) - len(other_word) == 1:
                    for j in range(len(other_word)):
                        if word[0:j] + word[j+1:] == other_word:
                            dict_graph[word].append(other_word)
                            dict_graph[other_word].append(word)
                # check if word can be gotten by changing a letter of other_word
                else:
                    for j in range(len(word)):
                        if word[0:j] + word[j+1:] == other_word[0:j] + other_word[j+1:]:
                            dict_graph[word].append(other_word)
                            dict_graph[other_word].append(word)

    return dict_graph

dict = ['cat', 'bat', 'bet', 'bed', 'at', 'ad', 'ed']
print(graphify_dictionary(dict))

def percolate_up_by_distance(pqueue, index):
    while index > 0 and pqueue[int((index-1)/2)][1] > pqueue[index][1]:
        pqueue[int((index-1)/2)], pqueue[index] = pqueue[index], pqueue[int((index-1)/2)]
        index = int((index-1)/2)

def transform_word(dictionary, w1, w2):
    graph = graphify_dictionary(dictionary)

    exhausted = { word: False for word in dictionary }

    pqueue = []

    pqueue.append((w1, 0, 'start'))

    while pqueue:
        word, distance, predecessor = pqueue.pop(0)

        for adjacent_word in graph[word]:
            # add logic for if word is actually equal to w2
            if adjacent_word == w2:
                path = [w2, word]
                while predecessor != 'start':
                    path.append(predecessor)
                    predecessor = exhausted[predecessor]
                return path[::-1]

            if not exhausted[adjacent_word]:
                if adjacent_word in [adjacent_word_info[0] for adjacent_word_info in pqueue]:
                    adjacent_word_info = next(info for info in pqueue if info[0] == adjacent_word)

                    if adjacent_word_info[1] > distance + 1:
                        adjacent_word_info_index = pqueue.index(adjacent_word_info)
                        pqueue = (adjacent_word, distance+1, word)
                        percolate_up_by_distance(pqueue, adjacent_word_info_index)
                else:
                    pqueue.append((adjacent_word, distance+1, word))
                    percolate_up_by_distance(pqueue, len(pqueue) - 1)

        exhausted[word] = predecessor

    return "No path found"

print(transform_word(['cat', 'bat', 'bet', 'bed', 'at', 'ad', 'ed'], 'cat', 'bed'))
# => ["cat", "bat", "bet", "bed"]

print(transform_word(['cat', 'bat', 'bed', 'at', 'ad', 'ed'], 'cat', 'bed'))
# => ["cat", "at", "ad", "ed", "bed"]

print(transform_word(['cat', 'bat', 'bed', 'ad', 'ed'], 'cat', 'bed'))
# => []

print(transform_word(['toon', 'poon', 'plee', 'same', 'poie', 'plea', 'plie', 'poin'], 'toon', 'plea'))
# => ["toon", "poon", "poin", "poie", "plie", "plee", "plea"]

print(transform_word(['toon', 'poon', 'plee', 'same', 'poie', 'plea', 'plie', 'poin'], 'plee', 'poie'))
# => ["plee", "plie", "poie"]
