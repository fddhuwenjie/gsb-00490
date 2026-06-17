#!/usr/bin/env minibash
# Test Script: case ... esac 语法 - 边界路径

echo "=== Test: case ... esac Edge Cases ==="

echo "--- Edge Test 1: Nested case ---"
outer=fruit
inner=apple
case $outer in
    fruit)
        echo "Outer: fruit category"
        case $inner in
            apple)
                echo "  Inner: red fruit"
                ;;
            banana)
                echo "  Inner: yellow fruit"
                ;;
        esac
        ;;
    veggie)
        echo "Outer: veggie category"
        ;;
esac

echo "--- Edge Test 2: Case with command substitution ---"
result="hello world"
case "$(echo hello world)" in
    hello*)
        echo "Command substitution pattern match"
        ;;
    *)
        echo "No match"
        ;;
esac

echo "--- Edge Test 3: Case combined with arithmetic ---"
x=10
case $((x * 2)) in
    10)
        echo "Got 10"
        ;;
    20)
        echo "Got 20 (arithmetic expansion works)"
        ;;
    30)
        echo "Got 30"
        ;;
esac

echo "--- Edge Test 4: Multiple wildcards ---"
path="/usr/local/bin/test"
case $path in
    /usr/*/bin/*)
        echo "Path pattern matched: $path"
        ;;
    *)
        echo "No match"
        ;;
esac

echo "--- Edge Test 5: Character class negation ---"
letter=m
case $letter in
    [!aeiou])
        echo "Consonant: $letter (negation class)"
        ;;
    *)
        echo "Vowel or other"
        ;;
esac

echo "--- Edge Test 6: Case inside for loop ---"
for item in apple 42 banana; do
    case $item in
        [0-9]*)
            echo "$item is a number"
            ;;
        [a-z]*)
            echo "$item is a word"
            ;;
    esac
done

echo "--- Edge Test 7: Quoted patterns ---"
str="hello world"
case "$str" in
    "hello world")
        echo "Quoted exact match works"
        ;;
    *)
        echo "No match"
        ;;
esac

echo "--- Edge Test 8: Single clause (no ;; before esac) ---"
val=test
case $val in
    test)
        echo "Single clause case works"
esac

echo "--- Edge Test 9: Variable with special characters ---"
special="a*b"
case "$special" in
    a\*b)
        echo "Escaped wildcard match works"
        ;;
    *)
        echo "Treated as pattern"
        ;;
esac

echo "--- Edge Test 10: Case exit code ---"
case "test" in
    nomatch)
        echo "No"
        ;;
esac
echo "Exit code when no match: $?"

case "test" in
    test)
        true
        ;;
esac
echo "Exit code when matched: $?"

echo "=== case ... esac Edge Tests Complete ==="
