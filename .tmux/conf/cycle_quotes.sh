#!/bin/zsh

# Path to the quotes file
QUOTE_FILE="$HOME/.config/tmux/quotes.txt"

# Path to the file storing the current quote index
INDEX_FILE="$HOME/.config/tmux/quote_index.txt"

# Get the total number of quotes
TOTAL_QUOTES=$(wc -l <"$QUOTE_FILE")

# Read the current index, or default to 0 if the index file doesn't exist
if [ ! -f "$INDEX_FILE" ]; then
  CURRENT_INDEX=0
else
  CURRENT_INDEX=$(cat "$INDEX_FILE")
fi

# Print the current quote
sed -n "$((CURRENT_INDEX + 1))p" "$QUOTE_FILE"

# Update the index for the next time
NEXT_INDEX=$(((CURRENT_INDEX + 1) % TOTAL_QUOTES))
echo "$NEXT_INDEX" >"$INDEX_FILE"
