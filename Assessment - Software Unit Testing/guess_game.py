'''importing random function'''
import random


class NumGuessGame:
    """ A number guessing game for which the player have to guess a secret 4-digit number."""
    def __init__(self):
        self.play_again = True

    def generate_secret_number(self):
        """Generate a random 4-digit number with no repeating digits."""
        while True:
            number = str(random.randint(1000, 9999))
            if len(set(number)) == 4:
                return number

    def get_user_input(self):
        """Get a 4-digit number from the user or ask to quit."""
        while True:
            user_input = input("\nEnter a 4-digit number or 'q' to quit: ")
            if user_input.lower() == 'q':
                return None
            # Checking for invalid input
            if not user_input.isdigit() or len(user_input) != 4:
                print("\nInvalid input. Please enter a 4-digit number.")
            else:
                return user_input

    def compare_numbers(self, secret_number, user_guess):
        """Compare the secret number and the user's guess, providing hints."""
        hints = ''
        for i in range(4):
            if user_guess[i] == secret_number[i]:
                hints += 'O'  # 'O' represents Correct digit in the correct position
            elif user_guess[i] in secret_number:
                hints += 'X'  # 'X' represents Correct digit in the wrong position
            else:
                hints += '$'  # '$'represents Incorrect digit
        return hints

    def play_game(self):
        """Run Guess the Number game."""
        print("     ---- Welcome To Guess The Number Game ----   ")

        while self.play_again:
            secret_number = self.generate_secret_number()
            attempts = 0

            print("(A random 4-digit number has been generated. Try to guess it.)")

            while True:
                user_guess = self.get_user_input()
                if user_guess is None:
                    break

                attempts += 1
                hints = self.compare_numbers(secret_number, user_guess)
                print("\t***************************")
                print("\tAttempt:", attempts, "\tHints:", hints)
                print("\t***************************")

                # Check if the user has guessed the correct number.
                if hints == 'OOOO':
                    print("\nCongratulations! You guessed the number", secret_number)
                    print("\tTotal number of attempts: ", attempts)
                    break

            # Ask if the user wants to play again.
            play_again = input("\nDo you want to play again? (yes/no): ").lower() == 'yes'
            self.play_again = play_again

        print("\n     ----Thanks For Playing----     ")


if __name__ == "__main__":
    game = NumGuessGame()
    game.play_game()
