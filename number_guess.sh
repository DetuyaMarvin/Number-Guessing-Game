#!/bin/bash

# Number guessing game for the freeCodeCamp challenge.
# fix: handle returning users
# refactor: normalize username input
# test: validate integer guesses
DB_NAME="number_guess"
PSQL="psql --username=freecodecamp --dbname=$DB_NAME -t -A -q -c"

if ! psql -lqt --username=freecodecamp 2>/dev/null | cut -d '|' -f 1 | grep -qw "$DB_NAME"; then
  createdb --username=freecodecamp "$DB_NAME" >/dev/null 2>&1
fi

psql --username=freecodecamp --dbname="$DB_NAME" -X -q <<'SQL' >/dev/null 2>&1
CREATE TABLE IF NOT EXISTS games (
  game_id SERIAL PRIMARY KEY,
  username VARCHAR(22) UNIQUE NOT NULL,
  games_played INT DEFAULT 0,
  best_game INT
);
SQL

echo "Enter your username:"
read -r username
username=${username%$'\r'}
safe_username=$(printf "%s" "$username" | sed "s/'/''/g")

user_record=$($PSQL "SELECT games_played, best_game FROM games WHERE username = '$safe_username';")

if [[ -n "$user_record" ]]; then
  IFS='|' read -r games_played best_game <<< "$user_record"
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
  games_played=0
  best_game=0
  echo "Welcome, $username! It looks like this is your first time here."
fi

secret_number=$(( RANDOM % 1000 + 1 ))
guesses=0

echo "Guess the secret number between 1 and 1000:"
while true; do
  read -r guess
  if [[ ! "$guess" =~ ^-?[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((guesses++))

  if (( guess < secret_number )); then
    echo "It's higher than that, guess again:"
  elif (( guess > secret_number )); then
    echo "It's lower than that, guess again:"
  else
    break
  fi
done

echo "You guessed it in $guesses tries. The secret number was $secret_number. Nice job!"

if [[ -n "$user_record" ]]; then
  new_games=$((games_played + 1))
  if (( best_game == 0 || guesses < best_game )); then
    best_game=$guesses
  fi
  $PSQL "UPDATE games SET games_played = $new_games, best_game = $best_game WHERE username = '$safe_username';"
else
  $PSQL "INSERT INTO games(username, games_played, best_game) VALUES('$safe_username', 1, $guesses);"
fi

# chore: tidy script
