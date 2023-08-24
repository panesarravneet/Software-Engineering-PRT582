import random

def generate_secret_number():
    return random.randint(1000, 9999)

def evaluate_guess(secret_number, guess):
    secret_str = str(secret_number)
    guess_str = str(guess)
    result = ''

    for i in range(4):
        if guess_str[i] == secret_str[i]:
            result += 'O'
        elif guess_str[i] in secret_str:
            result += 'X'
        else:
            result += '*'

    return result

if __name__ == "__main__":
    attempts = 0
    secret_number = generate_secret_number()

    while True:
        guess = input("Enter your guess (4 digits): ")
        
        if guess == "quit":
            break

        if len(guess) != 4 or not guess.isdigit():
            print("Invalid input. Please enter a 4-digit number.")
            continue

        guess = int(guess)
        attempts += 1

        result = evaluate_guess(secret_number, guess)

        if result == "****":
            print(f"Congratulations! You guessed the number in {attempts} attempts.")
            play_again = input("Play again? (yes/no): ").lower()
            if play_again != "yes":
                break

        print("Hints:", result)
