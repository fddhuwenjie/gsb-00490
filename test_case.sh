#!/usr/bin/env minibash
# Test Script: case ... esac syntax
# Covers normal paths and boundary/edge cases

echo "=== Test: case ... esac ==="

echo "--- Test 1: Basic exact match (normal path) ---"
fruit=apple
case $fruit in
    apple)
        echo "It's an apple"
        ;;
    banana)
        echo "It's a banana"
        ;;
    cherry)
        echo "It's a cherry"
        ;;
esac

echo "--- Test 2: Wildcard pattern match (normal path) ---"
file=report.pdf
case $file in
    *.txt)
        echo "Text file"
        ;;
    *.pdf)
        echo "PDF document"
        ;;
    *.sh)
        echo "Shell script"
        ;;
esac

echo "--- Test 3: Default case with * (boundary: fallback) ---"
color=yellow
case $color in
    red)
        echo "Color is red"
        ;;
    blue)
        echo "Color is blue"
        ;;
    *)
        echo "Unknown color: $color"
        ;;
esac

echo "--- Test 4: Multiple patterns with | (normal path) ---"
letter=b
case $letter in
    a|e|i|o|u)
        echo "Vowel"
        ;;
    b|c|d|f|g)
        echo "Consonant (first group)"
        ;;
    *)
        echo "Other letter"
        ;;
esac

echo "--- Test 5: No match and no default (boundary: no match) ---"
num=99
case $num in
    1)
        echo "One"
        ;;
    2)
        echo "Two"
        ;;
esac
echo "Exit code after no-match case: $?"

echo "--- Test 6: Variable expansion in word (normal path) ---"
name="hello world"
case "$name" in
    hello*)
        echo "Starts with hello"
        ;;
    *)
        echo "Does not start with hello"
        ;;
esac

echo "--- Test 7: Arithmetic expansion in case word (normal path) ---"
n=5
case $((n * 2)) in
    10)
        echo "5*2 = 10, correct"
        ;;
    *)
        echo "Unexpected result"
        ;;
esac

echo "--- Test 8: Character class pattern (normal path) ---"
ch=c
case $ch in
    [a-c])
        echo "In range a-c"
        ;;
    [d-f])
        echo "In range d-f"
        ;;
    *)
        echo "Other"
        ;;
esac

echo "--- Test 9: Empty word (boundary: empty string) ---"
empty=""
case "$empty" in
    "")
        echo "Word is empty"
        ;;
    *)
        echo "Word is not empty"
        ;;
esac

echo "--- Test 10: Case with first-match semantics (boundary: order matters) ---"
val=foobar
case $val in
    foo*)
        echo "Matched foo* (first)"
        ;;
    *bar)
        echo "Matched *bar (second)"
        ;;
    *)
        echo "Default"
        ;;
esac

echo "--- Test 11: Exit code from case body (boundary: exit code propagation) ---"
result=0
case test in
    test)
        false
        result=$?
        echo "Body exit code: $result"
        ;;
esac
echo "Case overall exit code: $?"

echo "--- Test 12: Quoted pattern (normal path) ---"
str="a|b"
case "$str" in
    "a|b")
        echo "Matched literal a|b"
        ;;
    a|b)
        echo "Matched a or b (alternation)"
        ;;
    *)
        echo "No match"
        ;;
esac

echo "=== Case Tests Complete ==="
