#!/usr/bin/env minibash
# Test Script: select syntax
# To run: printf "2\n99\nhello\n\n3\n1\n3\n2\n" | python3 minibash.py test_select.sh
# Covers normal paths and boundary/edge cases

echo "=== Test: select ==="

echo "--- Test 1: Basic select with valid choice (normal path) ---"
select choice in apple banana cherry date; do
    echo "You chose: $choice (REPLY=$REPLY)"
    break
done

echo "--- Test 2: Select with out-of-range choice (boundary: invalid) ---"
select fruit in orange grape mango; do
    echo "Fruit value: '$fruit' (REPLY=$REPLY)"
    break
done

echo "--- Test 3: Select with non-numeric input (boundary: invalid) ---"
select item in one two three; do
    echo "Item value: '$item' (REPLY=$REPLY)"
    break
done

echo "--- Test 4: Select with empty input re-prompts (boundary: empty) ---"
select val in first second third fourth; do
    echo "Got: $val (REPLY='$REPLY')"
    break
done

echo "--- Test 5: Select with custom PS3 prompt (normal path) ---"
PS3="Pick your option> "
select x in alpha beta gamma; do
    echo "Selected: $x"
    break
done
PS3="#? "

echo "--- Test 6: Select first item (boundary: first) ---"
select f in head middle tail; do
    echo "First item: $f (REPLY=$REPLY)"
    break
done

echo "--- Test 7: Select last item (boundary: last) ---"
select l in start mid end; do
    echo "Last item: $l (REPLY=$REPLY)"
    break
done

echo "--- Test 8: REPLY variable preserves raw input (normal path) ---"
select r in foo bar baz; do
    echo "REPLY raw: '$REPLY'"
    echo "Choice var: '$r'"
    break
done

echo "=== Select Tests Complete ==="
