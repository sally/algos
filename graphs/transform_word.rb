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

# make sure we can assume that both of the words given are actually in the list of words given
# is this case sensitive?
# can we assume that a shortest path actually exists?

# build a graph where the values of the nodes contain the words, and there exists an edge between two nodes if and only if their "edit distance" is 1
# do a breadth first search in the graph starting at word1, look for shortest path to word2

# utility function dictionary graph to return the edges of the graphified-dictionary as a hash table. the keys are the nodes, and the values are arrays that list all of the other nodes that the key is connected to
def graphify_dictionary(dictionary)
  edges = Hash.new {|hash, key| hash[key] = []}

  # iterate through dictionary
  for k in (0...dictionary.length) do
    current_word = dictionary[k]

    # iterate through all of the remaining words after current word
    for i in (k+1...dictionary.length) do
      # check if word can be gotten by removing a letter from current word
      if current_word.length - 1 == dictionary[i].length
        for j in (0...current_word.length) do
          if current_word[0...j] + current_word[j+1...current_word.length] == dictionary[i]
            edges[current_word] << dictionary[i]
            edges[dictionary[i]] << current_word
            break
          end
        end
      # check if word can be gotten by changing a letter of current word
      elsif current_word.length == dictionary[i].length
        for l in (0...current_word.length) do
          if current_word[0...l] + current_word[l+1...current_word.length] == dictionary[i][0...l] + dictionary[i][l+1...current_word.length]
            edges[current_word] << dictionary[i]
            edges[dictionary[i]] << current_word
            break
          end
        end
      # check if word can be gotten by adding a character to current word
      elsif current_word.length + 1 == dictionary[i].length
        for m in (0..current_word.length) do
          if current_word == dictionary[0...m] + dictionary[m+1...current_word.length]
            edges[current_word] << dictionary[i]
            edges[dictionary[i]] << current_word
            break
          end
        end
      else
        next
      end
    end
  end

  edges
end

p graphify_dictionary(['cat', 'bat', 'bet', 'bed', 'at', 'ad', 'ed'])

# utility function to insert into a priority queue (inserting into a min heap)
def insert_into_p_queue(queue, word_info)
  queue << word_info
  percolate_up_by_distance(queue, queue.length - 1)
end

def percolate_up_by_distance(queue, index)
  while index > 1 && queue[index][:distance] < queue[(index/2)][:distance]
    queue[index], queue[(index / 2)] = queue[(index / 2)], queue[index]
    index = (index / 2)
  end

  queue
end

def extract_from_p_queue(queue)
  info_to_return = queue[1]

  if queue.length > 2
    queue[1] = queue.pop
    percolate_down_by_distance(queue, 1)
  else
    queue.pop
  end

  info_to_return
end

def percolate_down_by_distance(queue, index)
  while index < queue.length - 1
    if queue[index*2] && queue[index*2 + 1]
      if queue[index*2][:distance] < queue[index][:distance] && queue[index*2][:distance] <= queue[index*2 + 1][:distance]
        queue[index*2], queue[index] = queue[index], queue[index*2]
        index = index*2
      elsif queue[index*2 + 1][:distance] < queue[index][:distance] && queue[index*2 + 1][:distance] < queue[index*2][:distance]
        queue[index*2 + 1], queue[index] = queue[index], queue[index*2 + 1]
        index = index*2 + 1
      else
        break
      end
    elsif queue[index*2] && !queue[index*2 + 1] && queue[index*2][:distance] < queue[index][:distance]
      queue[index*2], queue[index] = queue[index], queue[index*2]
      index = index*2
    elsif !queue[index*2] && queue[index*2 + 1] && queue[index*2 + 1][:distance] < queue[index][:distance]
      queue[index*2 + 1], queue[index] = queue[index], queue[index*2 + 1]
      index = index*2 + 1
    else
      break
    end
  end

  queue
end

p sample_queue = [nil, {word: 'bat', distance: 1}, {word: 'bed', distance: 3}]

p insert_into_p_queue(sample_queue, {word: 'bet', distance: 2})
p insert_into_p_queue(sample_queue, {word: 'cat', distance: 0})
p extract_from_p_queue(sample_queue)

p sample_queue

# dijkstra's to find shortest path between word1 and word2
def transform_word(dictionary, word1, word2)
  path = []

  edges = graphify_dictionary(dictionary)

  exhausted_words = []

  # entries in the priority queue are of the form: {word: 'cat', distance: 0}
  priority_queue = [nil]
  priority_queue << {word: word1, distance: 0, previous_word: nil}

  until priority_queue.length == 1
    current_word_info = extract_from_p_queue(priority_queue)
    current_word = current_word_info[:word]
    current_distance = current_word_info[:distance]

    adjacent_words = edges[current_word]

    for k in (0...adjacent_words.length) do
      if adjacent_words[k] == word2
        path.unshift(current_word, word2)
        previous_word = current_word_info[:previous_word]

        while previous_word
          path.unshift(previous_word)
          previous_word = exhausted_words.find{|word_info| word_info[:word] == previous_word}[:previous_word]
        end

        return path
      end

      if exhausted_words.map{|word_info| word_info[:word]}.include?(adjacent_words[k])
        next
      end

      if priority_queue[1..-1].map{|word_info| word_info[:word]}.include?(adjacent_words[k])
        adjacent_word_info = priority_queue[1..-1].find {|word_info| word_info[:word] = adjacent_words[k]}

        if adjacent_word_info[:distance] > current_distance + 1
          adjacent_word_index = priority_queue.index(adjacent_word_info)
          priority_queue[adjacent_word_index] = {word: adjacent_word_info[:word], distance: current_distance + 1, previous_word: current_word}
          percolate_up_by_distance(priority_queue, adjacent_word_index)
        end
      else
        insert_into_p_queue(priority_queue, {word: adjacent_words[k], distance: current_distance + 1, previous_word: current_word})
      end
    end

    exhausted_words << current_word_info
  end

  path
end

p transform_word(['cat', 'bat', 'bet', 'bed', 'at', 'ad', 'ed'], 'cat', 'bed')
# => ["cat", "bat", "bet", "bed"]

p transform_word(['cat', 'bat', 'bed', 'at', 'ad', 'ed'], 'cat', 'bed')
# => ["cat", "at", "ad", "ed", "bed"]

p transform_word(['cat', 'bat', 'bed', 'ad', 'ed'], 'cat', 'bed')
# => []

p transform_word(['toon', 'poon', 'plee', 'same', 'poie', 'plea', 'plie', 'poin'], 'toon', 'plea')
# => ["toon", "poon", "poin", "poie", "plie", "plee", "plea"]

p transform_word(['toon', 'poon', 'plee', 'same', 'poie', 'plea', 'plie', 'poin'], 'plee', 'poie')
# => ["plee", "plie", "poie"]

# big o analysis:
# I'll just do some big O analysis for the separate components of this problem.
# Inserting into a min/max heap: O(logN)
# Extracting from a min/max heap: O(logN)

# dijkstra's algorithm big O is O(E + Vlog(V)), where E is edges, V is vertices
  # E because we must loop through all of the edges worst case
  # Vlog(V) for priority queue bookkeeping

# building edge graph for dictionary: suppose V is the number of vertices
  # then run time is O(V^2)
  # space complexity is also O(V^2)

# future question to consider
# what if target word is at the last 2 units of edit distance of any word away?
