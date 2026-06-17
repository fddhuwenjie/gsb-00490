#!/usr/bin/env minibash
# Test Script: select 语法 - 边界路径
# 运行方式: printf "2\n3\n" | python3 minibash.py test_select_edge.sh

echo "=== Test: select Edge Cases ==="

if [ -t 0 ]; then
    echo "Interactive mode detected"
    exit 0
fi

echo "--- Edge Test 1: select with case statement ---"
PS3="Choose an option: "
select action in "say hello" "say goodbye" "exit"; do
    case $action in
        "say hello")
            echo "Hello, world!"
            ;;
        "say goodbye")
            echo "Goodbye!"
            ;;
        "exit")
            echo "Exiting..."
            break
            ;;
        "")
            echo "Invalid selection: $REPLY"
            ;;
    esac
done
echo "After select+case"

echo "--- Edge Test 2: select with continue ---"
count=0
select item in "skip me" "select me" "stop"; do
    if [ "$item" = "skip me" ]; then
        echo "Skipping..."
        continue
    fi
    if [ "$item" = "stop" ]; then
        echo "Stopping..."
        break
    fi
    count=$((count + 1))
    echo "Selected item #$count: $item"
done
echo "Total selected: $count"

echo "=== select Edge Tests Complete ==="
