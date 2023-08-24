'''importing random function'''
import random

def generate_random_number():
    """Generate a random 4-digit number with no repeating digits."""
    while True:
        number = str(random.randint(1000, 9999))
        if len(set(number)) == 4:
            return number

def get_user_guess():
    """Get a 4-digit number from the user."""
    while True:
        user_input = input("Enter a 4-digit number or 'q' to quit: ")
        if user_input.lower() == 'q':
            return None
        if not user_input.isdigit() or len(user_input) != 4:
            print("Invalid input. Please enter a 4-digit number.")
        else:
            return user_input

def compare_numbers(secret_number, user_guess):
    """Compare the secret number and the user's guess, providing feedback."""
    feedback = ''
    for i in range(4):
        if user_guess[i] == secret_number[i]:
            feedback += 'O'  # Correct digit in the correct position
        elif user_guess[i] in secret_number:
            feedback += 'X'  # Correct digit in the wrong position
        else:
            feedback += '#'  # Incorrect digit
    return feedback

def main():
    """Run the Guess the Number game."""
    print("Welcome to the Guess the Number game!")

    play_again = True
    while play_again:
        secret_number = generate_random_number()
        attempts = 0

        print("I've generated a 4-digit number. Try to guess it!")

        while True:
            user_guess = get_user_guess()
            if user_guess is None:
                break

            attempts += 1
            feedback = compare_numbers(secret_number, user_guess)
            print("Feedback:", feedback)

            if feedback == 'OOOO':
                print("Congratulations! You guessed the number {secret_number}")
                print("Number of attempts: {attempts}")
                break

        play_again = input("Do you want to play again? (yes/no): ").lower() == 'yes'

    print("Thanks for playing!")

if __name__ == "__main__":
    main()
