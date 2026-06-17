#!/usr/bin/env minibash
# Test Script: select 语法 - 边界路径
# 运行方式: printf "2\n3\n" | python3 minibash.py test_select_edge.sh

echo "=== Test: select Edge Cases ==="

if [ -t 0 ]; then
    echo "Interactive mode detected"
    echo "Run with: printf '2\n3\n' | python3 minibash.py test_select_edge.sh"
    exit 0
fi

echo "--- Edge Test 1: select in for loop ---"
count=0
for item in "test1" "test2"; do
    count=$((count + 1))
    echo "Iteration $count"
    break_loop=0
    select choice in option1 option2 option3; do
        if [ "$choice" != "" ]; then
            echo "Selected: $choice (REPLY=$REPLY)"
            break_loop=1
        fi
        break
    done
    if [ "$break_loop" = "1" ]; then
        break
    fi
done

echo "--- Edge Test 2: select with case statement ---"
select action in "say hello" "say goodbye" "exit"; do
    case $action in
        "say hello")
            echo "Hello there!"
            ;;
        "say goodbye")
            echo "Goodbye!"
            ;;
        "exit")
            echo "Exiting select..."
            exit 0
            ;;
        *)
            echo "Invalid choice: $REPLY"
            ;;
    esac
done

echo "=== select Edge Tests Complete ==="
