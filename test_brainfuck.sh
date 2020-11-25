testFiles=()
testInputs=()
testOutputs=()

function addTest {
    testFiles+=("$1")
    testInputs+=("$2")
    testOutputs+=("$3")
    
}

addTest "hello.bf" "" "Hello World!"
addTest "add.bf" "" "7"
addTest "rot13.bf" "abcdefghijklmnopqrstuvwxyz" "nopqrstuvwxyzabcdefghijklm"
addTest "rot13.bf" "nopqrstuvwxyzabcdefghijklm" "abcdefghijklmnopqrstuvwxyz"
addTest "cat.bf" "asdf" "asdf"
addTest "cat.bf" "1234" "1234"
addTest "cat.bf" "$(cat brainfuck_tests/text.txt)" "$(cat brainfuck_tests/text.txt)"

success=1

for i in ${!testFiles[@]};
do
    file="brainfuck_tests/${testFiles[$i]}"
    input=${testInputs[$i]}
    output=${testOutputs[$i]}

    testOutput="$(python3 brainfuck.py $file $input)"
    testDiff="$(diff <(echo $testOutput) <(echo $output))"

    if [ "$testDiff" != "" ]; then
        echo "Test Failed: $file"
        echo "Input:"
        echo "$input"
        echo "Diff:"
        echo "$testDiff"
        success=0
    fi
done

if [ $success = 1 ]; then
    echo "All tests passed!"
fi