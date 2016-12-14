# LeetCode: Single Number

# Given an array of integers, every element appears twice except for one. Find that single one.

# Note:
# Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

def single_number(nums)
  histogram = Hash.new(0)

  nums.each do |num|
    if histogram[num].zero?
      histogram[num] += 1
    else histogram[num] == 1
      histogram.delete(num)
    end
  end

  histogram.keys.first
end
