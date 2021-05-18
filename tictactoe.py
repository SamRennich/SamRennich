# Tic-Tac-Toe
# A program that runs tic-tac-toe in the console and allows for two player or single player games
# May 11, 2021

# Libraries
import os
import time

# Define functions

def cls(): # Clears the screen (taken from SO)
    os.system('cls' if os.name=='nt' else 'clear')
    
def resetBoard() :
    board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def printBoard(): # Prints the board
    
    print("         |         |         ")
    print("    " + board[0] + "    |    " + board[1] + "    |    " + board[2] + "    ")
    print("         |         |         ")
    print("---------|---------|---------")
    print("         |         |         ")
    print("    " + board[3] + "    |    " + board[4] + "    |    " + board[5] + "    ")
    print("         |         |         ")
    print("---------|---------|---------")
    print("         |         |         ")
    print("    " + board[6] + "    |    " + board[7] + "    |    " + board[8] + "    ")
    print("         |         |         ")

def checkForWinner(): # Checks to see if there is any winner
    print("Beans")

def checkForDraw(): # Checks to see if there is any draw
    print("Beans")
    
def intro(): # Introduces the game and prompts user to 
    
    # Welcome user
    print("Welcome to Tic-Tac-Toe!")
    
    while True :
        
        # Prompt user for choice
        choice = input("Enter 1 for Single Player or 2 for Two Player: ")
        
        if choice == "1" : # Single player choice
            return 1
        elif choice == "2" : # Two player choice
            return 2
        else : # Invalid input
            print(invalid)
    
    


# Main Program

# Declare setup variables
board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] # Stores the board
exitFlag = True # Controls when to exit the program
anotherGame = True # Controls when to play another game
gameOver = True # Controls when to finish the game
invalid = "That input is invalid. Please reenter."

# Clear screen
cls()

# Welcome user
print("Welcome to Tic-Tac-Toe!")

while exitFlag : # Controls when to exit the program
    
    validFlag = True # Stores the validity of the input
    
    while validFlag : # Repeat until input is valid
        
        # Prompt for choice
        choice = input("Please enter 1 for Single Player or 2 for Two Player: ")
        
        if choice == 1 or choice == 2 : # Valid
            validFlag = False
        else : # Invalid
            print(invalid)
    
    
    
    while anotherGameFlag : # Controls when to play another game
        while gameOverFlag : # Controls when to finish the game
