#!/usr/bin/env minibash
# Test Script: select 语法 - 正常路径
# 运行方式: printf "2\n" | python3 minibash.py test_select.sh

echo "=== Test: select Normal Path ==="

if [ -t 0 ]; then
    echo "Interactive mode detected"
    echo "Run with: printf '2\n' | python3 minibash.py test_select.sh"
    exit 0
fi

echo "--- Test 1: Basic select with break ---"
select fruit in apple banana cherry; do
    if [ "$fruit" = "banana" ]; then
        echo "Selected: $fruit"
        echo "REPLY: $REPLY"
        break
    fi
    echo "Try again: $fruit"
done
echo "After select loop"

echo "=== select Normal Tests Complete ==="
