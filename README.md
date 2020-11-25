# BF Interpreters

## Brainfuck

Copy the starter code into a new file called `brainfuck.py` and implement the `evaluate` function.

Usage: `python brainfuck.py <program_file_path> <optional_input>`

To test your implementation, run `./test.sh brainfuck`. You may have to add execution priviliges with `chmod +x test.sh` first.

### Tips

- `chr(x)` converts an ASCII value into a character
- `ord(c)` converts a character into an ASCII value
- It may be helpful to implement EOF by "reading in" a 0 whenever the `,` command is called after all of the input has already been read.
- If you want to use a file for input, you can run `python brainfuck.py <program_file_path> "$(cat <input_file_path>)"`

## Befunge

Copy the starter code into a new file called `befunge.py` and implement the `evaluate` function.

Usage: `python befunge.py <program_file_path> <optional_input>`

To test your implementation, run `./test.sh befunge`. Note: the tests for befunge are less exhaustive than those for brainfuck. You may want to add your own.
