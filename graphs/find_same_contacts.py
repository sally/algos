# Given a list of contacts containing username, email, and phone number in any order, identify the same contacts (i.e. the same peson having many different contact entries) and output the same contacts together.

# Notes:
    # (1) A contact can store its three fields in any order, i.e. phone number can appear before username or username can appear before phone number.
    # (2) Two contacts are the same if they have either the same username or email or phone number.

# Example:

# Input:

contacts = [
       {"Gaurav", "gaurav@gmail.com", "gaurav@gfgQA.com"},
       { "Lucky", "lucky@gmail.com", "+1234567"},
       { "gaurav123", "+5412312", "gaurav123@skype.com"},
       { "gaurav1993", "+5412312", "gaurav@gfgQA.com"}
            ]

# Output:

0 2 3

# Explanation:

# contacts[2] is the same as contact[3] because they both have the same phone number.
# contact[0] is the same as contact[3] because they both have same email address.
# therefore, contact 0 and 2 are also the same.
