import sys


# parse : String --> String List List
# Returns parsed version of program from given file as a 2D list of tokens.
# The sub-lists are padded with additional spaces as needed to equalize the length of each line.
# This function does not perform any static syntax checking cause that would be hard :^)
def parse(file_path):
    def get_lines(file_path):
        with open(file_path, "r") as file:
            return [line.rstrip("\n") for line in file.readlines()]

    def parse_lines(lines):
        width = max(len(line) for line in lines)
        height = len(lines)
        program = [[" " for col in range(width)] for row in range(height)]
        for row in range(len(lines)):
            for col in range(len(lines[row])):
                line = lines[row]
                program[row][col] = line[col]

        return program

    return parse_lines((get_lines(file_path)))


# evaluate : String List List, String --> None
# Evaluates the given befunge program using the input string as pre-determined user input.
# A lack of user input is provided as an empty string.
def evaluate(program, user_input):
    ### Replace With Your Code ###
    for line in program:
        print(line)
    print(user_input)

   # Initialize whatever you need to represent the state

   # While the program hasn’t terminated, execute the next instruction.



if len(sys.argv) < 2:
    raise ValueError("Too few arguments: Proper usage is `python befunge.py <program_file_path> <optional_input>`")

path = sys.argv[1]
user_input = ""
if len(sys.argv) >= 3:
    user_input = sys.argv[2]
    for i in range(3, len(sys.argv)):
        user_input += " " + sys.argv[i]

evaluate(parse(path), user_input)
