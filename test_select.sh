#!/usr/bin/env minibash
# Test Script: select syntax (normal and edge cases)

echo "=== Test: select syntax ==="

echo "--- Test 1: Basic select with break ---"
PS3="Pick a color: "
select color in red green blue; do
    echo "Selected: $color (REPLY=$REPLY)"
    if [ "$color" = "green" ]; then
        echo "Breaking on green"
        break
    fi
done <<'INPUT'
1
3
2
INPUT
echo "After select 1"

echo ""
echo "--- Test 2: Invalid input (out of range and non-numeric) ---"
select x in alpha beta; do
    echo "x='$x' REPLY='$REPLY'"
    if [ "$REPLY" = "quit" ]; then
        echo "Quitting"
        break
    fi
done <<'INPUT'
5
hello
quit
INPUT
echo "After select 2"

echo ""
echo "--- Test 3: Empty input (just enter) ---"
select y in one two; do
    echo "y='$y' REPLY='$REPLY'"
    if [ "$REPLY" = "2" ]; then
        break
    fi
done <<'INPUT'

2
INPUT
echo "After select 3"

echo ""
echo "--- Test 4: Variable expansion in word list ---"
items="foo bar baz"
select opt in $items; do
    echo "Option: $opt"
    break
done <<'INPUT'
2
INPUT
echo "After select 4"

echo ""
echo "--- Test 5: select with case statement ---"
select action in start stop status; do
    case $action in
        start)
            echo "Starting..."
            ;;
        stop)
            echo "Stopping..."
            break
            ;;
        status)
            echo "Status: running"
            ;;
    esac
done <<'INPUT'
1
3
2
INPUT
echo "After select 5"

echo ""
echo "=== select Tests Complete ==="
