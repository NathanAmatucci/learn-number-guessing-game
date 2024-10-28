#!/bin/bash
# Variabile per il comando PSQL
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Chiedi il nome utente
echo "Enter your username:"
read USERNAME

# Controlla se l'utente esiste già
USER_INFO=$($PSQL "SELECT users_id, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USER_INFO ]]; then
  # Utente non trovato, aggiungilo al database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Utente trovato, mostra il messaggio di benvenuto
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Genera un numero casuale tra 1 e 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

# Inizializza il numero di tentativi
NUMBER_OF_GUESSES=0

# Inizia il ciclo di tentativi
while true; do
  read GUESS
  NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))

  # Controlla se l'input è un numero
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Verifica se il numero è corretto, troppo alto o troppo basso
  if (( GUESS == SECRET_NUMBER )); then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Aggiorna il database con i nuovi dati di gioco
    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
      UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")
    else
      UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")
    fi
    break
  elif (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done
