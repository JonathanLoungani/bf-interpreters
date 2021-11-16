import sys


# parse : String --> String List
# Returns parsed version of program from given file as a list of tokens.
# Whitespace and other characters in the file which are not brainfuck instructions are ignored.
# Raises a ValueError if the program is a malformed brainfuck program.
def parse(file_path):
    def get_lines(file_path):
        with open(file_path, "r") as file:
            return file.readlines()

    def parse_lines(lines):
        valid_tokens = ['>', '<', '+', '-', '.', ',', '[', ']']
        open_brackets = 0
        program = []
        character_number = 0
        for line in lines:
            for character in line:
                character_number += 1
                if character in valid_tokens:
                    program += [character]
                    if character == '[':
                        open_brackets += 1
                    if character == ']':
                        open_brackets -= 1
                        if open_brackets < 0:
                            raise ValueError("Parsing error: unmatched ] at character " + str(character_number))
        if open_brackets > 0:
            raise ValueError("Parsing error: " + str(open_brackets) + " open bracket(s) unmatched")
        elif open_brackets < 0:
            raise ValueError("Parsing error: " + str(-open_brackets) + " closed bracket(s) unmatched")
        return program

    return parse_lines((get_lines(file_path)))


# evaluate : String List, String --> None
# Evaluates the given brainfuck program using the input string as pre-determined user input.
# A lack of user input is provided as an empty string.
def evaluate(program, user_input):
    ### Replace With Your Code ###
    print(program, user_input)

   # Initialize whatever you need to represent the state

   # While the program hasn’t terminated, execute the next instruction.

    
if len(sys.argv) < 2:
    raise ValueError("Too few arguments: Proper usage is `python brainfuck.py <program_file_path> <optional_input>`")

path = sys.argv[1]
user_input = ""
if len(sys.argv) >= 3:
    user_input = sys.argv[2]
    for i in range(3, len(sys.argv)):
        user_input += " " + sys.argv[i]

evaluate(parse(path), user_input)
