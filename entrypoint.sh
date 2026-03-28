#!/bin/sh

if [ -z "$SERVER_NAME" ]; then
  ADJECTIVES="blue red wild dark swift brave calm crazy happy funky"
  ANIMALS="platypus narwhal axolotl panda capybara ferret penguin salamander"

  ADJ=$(echo $ADJECTIVES | tr ' ' '\n' | shuf -n1)
  ANIMAL=$(echo $ANIMALS | tr ' ' '\n' | shuf -n1)

  SERVER_NAME="${ADJ}-${ANIMAL}"
  echo "No SERVER_NAME set, generated: $SERVER_NAME"
fi

echo "Starting server: ${SERVER_NAME}-server"

# Port conflict check
PORT=${SERVER_PORT:-25565}
if nc -z 0.0.0.0 $PORT 2>/dev/null; then
  echo "ERROR: Port $PORT is already in use! Change SERVER_PORT in .env"
  exit 1
fi

exec sh /server/run.sh