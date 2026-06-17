#!/usr/bin/env minibash
# Test Script: case ... esac

echo "=== Test: case ... esac ==="

echo "--- basic case match ---"
fruit="apple"
case $fruit in
  apple) echo "It is an apple" ;;
  banana) echo "It is a banana" ;;
  cherry) echo "It is a cherry" ;;
esac

echo "--- wildcard match ---"
name="hello world"
case $name in
  hello*) echo "Starts with hello" ;;
  *world) echo "Ends with world" ;;
  *) echo "No match" ;;
esac

echo "--- default case with * ---"
color="purple"
case $color in
  red) echo "Red" ;;
  blue) echo "Blue" ;;
  *) echo "Other color: $color" ;;
esac

echo "--- pipe alternation ---"
animal="cat"
case $animal in
  cat|dog|rabbit) echo "Common pet: $animal" ;;
  lion|tiger) echo "Wild animal: $animal" ;;
  *) echo "Unknown animal" ;;
esac

echo "--- case with variable expansion ---"
val=42
case $val in
  42) echo "The answer" ;;
  *) echo "Not the answer" ;;
esac

echo "--- case with no match ---"
x="xyz"
case $x in
  abc) echo "matched abc" ;;
  def) echo "matched def" ;;
esac
echo "After no-match case, exit code: $?"

echo "--- case with question mark pattern ---"
letter="b"
case $letter in
  [a-c]) echo "Matched range a-c" ;;
  *) echo "No range match" ;;
esac

echo "--- nested case in if ---"
mode="fast"
if true; then
  case $mode in
    fast) echo "Fast mode active" ;;
    slow) echo "Slow mode active" ;;
  esac
fi

echo "--- case with arithmetic expansion ---"
num=3
case $num in
  1) echo "one" ;;
  2) echo "two" ;;
  3) echo "three" ;;
  *) echo "other" ;;
esac

echo "--- case with empty string ---"
empty=""
case $empty in
  "") echo "Empty string matched" ;;
  *) echo "Not empty" ;;
esac

echo "=== case ... esac Tests Complete ==="
