# Write a program that, given a 7 digit telephone number, print all possible combinations of letters that each number could represent.

digit_map = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz',
}

def letter_combos(phone_num):
    combos = ['']

    for k in phone_num:
        letters = digit_map.get(k, None)
        if letters:
            combos = [combo + letter for combo in combos for letter in letters]
    return combos

print(letter_combos('7033005426'))
print(letter_combos('5102299071'))
