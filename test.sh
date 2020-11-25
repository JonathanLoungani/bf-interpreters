testFiles=()
testInputs=()
testOutputs=()

function addTest {
    testFiles+=("$1")
    testInputs+=("$2")
    testOutputs+=("$3") 
}

if [ $1 = "brainfuck" ]; then
    testDir="brainfuck_tests"
    interpreter="brainfuck.py"

    addTest "hello.bf" "" "Hello World!"
    addTest "add.bf" "" "7"
    addTest "rot13.bf" "abcdefghijklmnopqrstuvwxyz" "nopqrstuvwxyzabcdefghijklm"
    addTest "rot13.bf" "nopqrstuvwxyzabcdefghijklm" "abcdefghijklmnopqrstuvwxyz"
    addTest "cat.bf" "asdf" "asdf"
    addTest "cat.bf" "1234" "1234"
    addTest "cat.bf" "$(cat brainfuck_tests/text.txt)" "$(cat brainfuck_tests/text.txt)"

    echo "Testing brainfuck interpreter..."
elif [ $1 = "befunge" ]; then
    testDir="befunge_tests"
    interpreter="befunge.py"

    addTest "hello.befunge" "" "Hello, World!"
    addTest "cat.befunge" "asdf" "asdf"
    addTest "cat.befunge" "1234" "1234"
    addTest "cat.befunge" "$(cat brainfuck_tests/text.txt)" "$(cat brainfuck_tests/text.txt)"
    addTest "factorial.befunge" "1" "1"
    addTest "factorial.befunge" "2" "2"
    addTest "factorial.befunge" "3" "6"
    addTest "factorial.befunge" "4" "24"
    addTest "factorial.befunge" "10" "3628800"
    addTest "sieve.befunge" "" "2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 "
    addTest "quine.befunge" "" "01->1# +# :# 0# g# ,# :# 5# 8# *# 4# +# -# _@"

    echo "Testing befunge interpreter..."
else
    echo "Unrecognized interpreter type: $1"
    exit
fi

if [ ! -f "$interpreter" ]; then
    echo "Could not find file: $interpreter"
    exit
fi

success=1
testsPassed=0

for i in ${!testFiles[@]};
do
    file="$testDir/${testFiles[$i]}"
    input=${testInputs[$i]}
    output=${testOutputs[$i]}

    testOutput="$(python3 $interpreter $file $input)"
    testDiff="$(diff <(echo $testOutput) <(echo $output))"

    if [ "$testDiff" != "" ]; then
        echo "Test Failed: $file"
        echo "Input:"
        echo "$input"
        echo "Diff:"
        echo "$testDiff"
        success=0
    else
        ((testsPassed=testsPassed+1))
    fi
done

if [ $success = 1 ]; then
    echo "All $testsPassed tests passed!"
fi