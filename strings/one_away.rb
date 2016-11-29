# CTCI: One Away

# There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.

# Example inputs: "pale, ple" #=> true
# "pales, pale" #=> true
# "pale, bale" #=> true
# "pale, bake" #=> false

#################################

# Two strings being one edit distance away from each other entails there only being room for one 'error'
# Iterate through the strings (take the max of str1 and str2's lengths)
# Count errors at each step - if errors exceeds one, then return false

# initial check for being at max one length apart?

def one_away?(str1, str2)
  if (str1.length - str2.length).between?(0,1)
    str1_index = 0
    str2_index = 0
    errors = 0

    count_errors = lambda do |str1, str2|
      if str1[str1_index] == str2[str2_index]
        str1_index += 1
        str2_index += 1
      else
        if errors == 0
          errors += 1
        else
          return false
        end

        if str1.length > str2.length
          str1_index += 1
        elsif str2.length > str1.length
          str2_index += 1
        else
          str1_index += 1
          str2_index += 1
        end
      end
    end

    [str1.length, str2.length].max.times { count_errors.call(str1, str2) }
  else
    false
  end

  return true
end

p one_away?('pale', 'ple')
p one_away?('pales', 'pale')
p one_away?('pale', 'bale')
p one_away?('pale', 'bake')
