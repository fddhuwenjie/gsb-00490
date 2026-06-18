#!/usr/bin/env minibash
# Test Script: case ... esac syntax

echo "=== Test: case ... esac ==="

echo "--- test 1: basic exact match ---"
fruit=apple
case $fruit in
    apple)
        echo "It's an apple"
        ;;
    banana)
        echo "It's a banana"
        ;;
    orange)
        echo "It's an orange"
        ;;
esac

echo "--- test 2: wildcard pattern match ---"
filename="test.txt"
case $filename in
    *.txt)
        echo "Text file"
        ;;
    *.sh)
        echo "Shell script"
        ;;
    *.py)
        echo "Python file"
        ;;
esac

echo "--- test 3: multiple patterns with | ---"
color=green
case $color in
    red|green|blue)
        echo "Primary color"
        ;;
    yellow|cyan|magenta)
        echo "Secondary color"
        ;;
    *)
        echo "Other color"
        ;;
esac

echo "--- test 4: default case with * ---"
value=42
case $value in
    1)
        echo "One"
        ;;
    2)
        echo "Two"
        ;;
    *)
        echo "Something else: $value"
        ;;
esac

echo "--- test 5: variable expansion in pattern ---"
ext="log"
file="app.log"
case $file in
    *.$ext)
        echo "Matched $ext file"
        ;;
    *)
        echo "No match"
        ;;
esac

echo "--- test 6: no match (exit code 0) ---"
x=hello
case $x in
    foo)
        echo "foo"
        ;;
    bar)
        echo "bar"
        ;;
esac
echo "Exit code after no-match case: $?"

echo "--- test 7: nested case ---"
shape=circle
size=large
case $shape in
    circle)
        case $size in
            small)
                echo "Small circle"
                ;;
            large)
                echo "Large circle"
                ;;
        esac
        ;;
    square)
        echo "Square"
        ;;
esac

echo "--- test 8: arithmetic in case word ---"
n=5
case $((n * 2)) in
    10)
        echo "5*2=10, correct"
        ;;
    *)
        echo "Wrong"
        ;;
esac

echo "--- test 9: empty word ---"
empty=""
case $empty in
    "")
        echo "Empty string matched"
        ;;
    *)
        echo "Not empty"
        ;;
esac

echo "--- test 10: case with command substitution ---"
case $(echo hello) in
    hello)
        echo "Command substitution in case word works"
        ;;
    *)
        echo "No match"
        ;;
esac

echo "=== case Tests Complete ==="
