#!/usr/bin/env minibash
# Test Script: select loop

echo "=== Test: select loop ==="

echo "--- select with predefined input ---"
PS3="Choose: "
select item in apple banana cherry; do
  echo "You selected: $item"
  echo "Reply was: $REPLY"
  break
done

echo "--- select with break on first choice ---"
select color in red green blue; do
  if [ -n "$color" ]; then
    echo "Picked color: $color"
  else
    echo "Invalid choice: $REPLY"
  fi
  break
done

echo "--- select with case inside ---"
select opt in start stop restart; do
  case $opt in
    start) echo "Starting..." ;;
    stop) echo "Stopping..." ;;
    restart) echo "Restarting..." ;;
    *) echo "Unknown: $REPLY" ;;
  esac
  break
done

echo "--- select REPLY variable ---"
select val in one two three; do
  echo "REPLY=$REPLY"
  echo "val=$val"
  break
done

echo "--- select with empty list ---"
select x in; do
  echo "Should not loop"
  break
done

echo "=== select loop Tests Complete ==="
