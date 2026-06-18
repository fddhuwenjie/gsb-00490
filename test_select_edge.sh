#!/usr/bin/env minibash
# Test Script: select syntax - edge cases

echo "=== Test: select edge cases ==="

echo "--- Test 1: EOF exits select loop ---"
select x in a b c; do
    echo "Got: $x"
done
echo "After EOF test"

echo ""
echo "--- Test 2: Empty word list (should do nothing) ---"
empty=""
select y in $empty; do
    echo "Should not reach here"
done
echo "After empty list test"

echo ""
echo "--- Test 3: Single item select ---"
select z in only_one; do
    echo "Selected: $z"
    break
done
echo "After single item test"

echo ""
echo "=== select edge case Tests Complete ==="
