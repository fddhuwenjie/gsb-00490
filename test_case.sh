#!/usr/bin/env minibash
# Test Script: case ... esac 语法 - 正常路径

echo "=== Test: case ... esac Normal Path ==="

echo "--- Test 1: Exact match ---"
fruit=apple
case $fruit in
    apple)
        echo "It's an apple"
        ;;
    banana)
        echo "It's a banana"
        ;;
esac

echo "--- Test 2: Multiple patterns with | ---"
color=green
case $color in
    red|green|blue)
        echo "Primary color: $color"
        ;;
    yellow|purple|orange)
        echo "Secondary color: $color"
        ;;
esac

echo "--- Test 3: Wildcard * match ---"
filename=test.txt
case $filename in
    *.txt)
        echo "Text file: $filename"
        ;;
    *.sh)
        echo "Shell script: $filename"
        ;;
    *)
        echo "Unknown type: $filename"
        ;;
esac

echo "--- Test 4: Single char wildcard ? match ---"
name=ab
case $name in
    a?)
        echo "Two chars starting with a: $name"
        ;;
    ?b)
        echo "Two chars ending with b: $name"
        ;;
esac

echo "--- Test 5: Character class [] match ---"
digit=5
case $digit in
    [0-9])
        echo "Single digit: $digit"
        ;;
    [a-z])
        echo "Lowercase letter: $digit"
        ;;
esac

echo "--- Test 6: Default case with *) ---"
unknown=xyz
case $unknown in
    apple)
        echo "Fruit"
        ;;
    *)
        echo "Default case triggered: $unknown"
        ;;
esac

echo "--- Test 7: Variable expansion in pattern ---"
suffix=txt
file=data.txt
case $file in
    *.$suffix)
        echo "Matches *.$suffix: $file"
        ;;
esac

echo "--- Test 8: Empty string match ---"
empty=""
case $empty in
    "")
        echo "Empty string matched"
        ;;
    *)
        echo "Not empty"
        ;;
esac

echo "--- Test 9: Case with no match (no default) ---"
nomatch=hello
case $nomatch in
    apple)
        echo "Should not print"
        ;;
    banana)
        echo "Should not print either"
        ;;
esac
echo "No-match case completed (exit code: $?)"

echo "--- Test 10: Case with numbers ---"
num=42
case $num in
    1)
        echo "One"
        ;;
    42)
        echo "The answer"
        ;;
    100)
        echo "Hundred"
        ;;
esac

echo "=== case ... esac Normal Tests Complete ==="
