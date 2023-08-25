"""
Module: test_guess_game.py

This module contains a series of unit tests,
 for the NumGuessGame class from the 'guess_game' module.
The NumGuessGame class represents a number guessing game in,
 which the player has to guess a secret 4-digit number.

These tests ensure that the game functions correctly,
by checking various aspects such as generating a valid secret number,
comparing player guesses with the secret number, and providing appropriate hints.

Tested Scenarios:
1. Generating a secret number:
   - Validity: Check if the generated number is within the valid range,
     is a string, has 4 digits, has unique digits,and consists of only digits.

2. Comparing player guesses with the secret number:
   - All digits are correct.
   - All digits are correct but in the wrong position.
   - All digits are incorrect.
   - A mix of correct and incorrect digits.

Author: Ravneet Singh
Date: 22/08/2023

"""

import unittest
from guess_game import NumGuessGame  # importing class correctly


class TestNumGuessGame(unittest.TestCase):
    """ Testing A number guessing game,
    For which the player have to guess a secret 4-digit number."""
    def setUp(self):
        self.game = NumGuessGame()

    def tearDown(self):
        self.game = NumGuessGame()

    def test_generate_secret_number(self):
        """Test to check the generated number"""
        secret_number = self.game.generate_secret_number()
        # Check if the generated number is within the valid range
        self.assertTrue(1000 <= int(secret_number) <= 9999)
        print("Test to check generated number is within the valid range : Completed Sucessfully")
        # Check if the generated number is a string
        self.assertTrue(isinstance(secret_number, str))
        print("Test to check generated number is a string : Completed Sucessfully")
        # Check if the generated number is 4 digits
        self.assertEqual(len(secret_number), 4)
        print("Test to check generated number is 4 digits : Completed Sucessfully")
        # Check if all digits are unique
        self.assertEqual(len(set(secret_number)), 4)
        print("Test to check all digits of generated number are unique : Completed Sucessfully")
        # Check if all characters are digits
        self.assertTrue(secret_number.isdigit())
        print("Test to check all characters of generated number are digits : Completed Sucessfully")

    def test_all_correct(self):
        """Test when all digits are correct"""
        hints = self.game.compare_numbers("1234", "1234")
        self.assertEqual(hints, "OOOO")
        print('Test when all digits are correct : Completed Sucessfully')

    def test_wrong_pos(self):
        """Test when all digit is correct but in the wrong position"""
        hints = self.game.compare_numbers("1234", "4321")
        self.assertEqual(hints, "XXXX")
        print('Test when all digit is correct but in the wrong position : Completed Sucessfully')

    def test_incorrect_num(self):
        """Test when all digits are incorrect"""
        hints = self.game.compare_numbers("1234", "5678")
        self.assertEqual(hints, "$$$$")
        print('Test when all digits are incorrect : Completed Sucessfully')

    def test_mix_num(self):
        """Test a mix of correct and incorrect digits"""
        hints = self.game.compare_numbers("1234", "1243")
        self.assertEqual(hints, "OOXX")
        print('Test a mix of correct and incorrect digits : Completed Sucessfully')


if __name__ == '__main__':
    unittest.main()
