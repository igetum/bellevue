#--------------------------------------------------------------------------
# 
# Script Name: NumberGuess.rb
# Version:     2.0
# Author:      Antone Cabral
# Date:        9/23/19
# 
# Description: This Ruby script is a number guessing game that challenges 
#              the player to guess a randomly generated number in as few 
#              guesses as possible.
# Changes:
# 1. Calculated and displayed total game count and average guesses of games.
# 2. Created $maxChallengeRange varible to modify the games maximum random number maxChallengeRange
# 3. Added error prompt when in correct character or out of range values are entered
# 4. Limited the guesses via $maxGameGuesses per game
# 5. Created a cheatmode
#
#--------------------------------------------------------------------------



#--------------------------------------------------------------------------
# 
# Script Name: NumberGuess.rb
# Version:     1.0
# Author:      Jerry Lee Ford, Jr.
# Date:        March 2010
# 
# Description: This Ruby script is a number guessing game that challenges 
#              the player to guess a randomly generated number in as few 
#              guesses as possible.
#
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
    puts "\a"  #Make a little noise to get the player's attention
  end
  
  def pause    #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
                #execution until the player presses the enter key
  end
  
end

#Define a class representing the Ruby Number Guessing Game
class Game
 
  #This method displays the game's opening screen
  def display_greeting
  
    Console_Screen.cls  #Clear the display area
  
    #Display welcome message
    print "\t\t  Welcome to the Ruby Number Guessing Game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."
  
  Console_Screen.pause       #Pause the game

  end
 
  #Define a method to be used to present game instructions
  def display_instructions
    
    Console_Screen.cls       #Clear the display area
    puts "INSTRUCTIONS:\n\n"  #Display a heading

    #Display the game's instructions
    puts "This game randomly generates a number from 1 to 1000 and" 
    puts "challenges you to identify it in as few guesses as possible."
    puts "After each guess, the game will analyze your input and provide"
    puts "you with feedback. You have a maximum of 10 turns in" 
    puts "order to guess the game's secret number.\n\n\n"
    puts "Good luck!\n\n\n\n\n\n\n\n\n"
    print "Press Enter to continue."

    Console_Screen.pause       #Pause the game
    
  end
 
  #Define a method that generates the game's secret number
  def generate_number
  
    #Generate and return a random number between 1 and 100
    return randomNo = 1 + rand($maxChallengeRange)
  
  end
 
  #Define a method to be used control game play
  def play_game

    #Call on the generate_number method in order to get a random number
    number = generate_number
    $noOfGuesses = 0 

    #Loop until the player inputs a valid answer
    loop do
  
      Console_Screen.cls       #Clear the display area
    
      

      if $noOfGuesses > $maxGameGuesses then
        print "You exceeded the allowed number of guesses of " + $maxGameGuesses.to_s + "."
        print "\nYou lose! Please try again."
        print "\n\nPress enter to continue."
        Console_Screen.pause 
        break
      end

      if $cheatMode == true then
        print "\nShh.... the answer is " + number.to_s 
      end

      #Prompt the player to make a guess
      print "\n\nEnter your guess and press the Enter key: "
      
  
      reply = STDIN.gets  #Collect the player's answer
      reply.chop!         #Remove the end of line character

      reply = reply.to_i

      if reply < 1 || reply > $maxChallengeRange then
        Console_Screen.cls
        print "\nInvalid entry. Please enter a number between 1 and " + $maxChallengeRange.to_s
        print "\n\nPlease press enter to continue."
        Console_Screen.pause
        redo  #Redo the current iteration of the loop
      end
      
      $noOfGuesses = $noOfGuesses + 1
    
      #Analyze the player's guess to determine if it is correct
      if reply == number then    #The player's guess was correct
        Console_Screen.cls        #Clear the display area
        print "You have guessed the number! Press enter to continue."
        Console_Screen.pause      #Pause the game
        break  #Exit loop
      elsif reply < number then  #The player's guess was too low
        Console_Screen.cls        #Clear the display area
        print "Your guess is too low! Press Enter to continue.\n\n"
        Console_Screen.pause      #Pause the game
      elsif reply > number then  #The player's guess was too high
        Console_Screen.cls        #Clear the display area
        print "Your guess is too high! Press Enter to continue.\n\n"
        Console_Screen.pause      #Pause the game
      end

      
      
    end

  end

  #This method displays the information about the Ruby Number Guessing Game
  def display_credits
  
    Console_Screen.cls  #Clear the display area
  
    #Thank the player and display game information
    puts "\t\tThank you playing the Ruby Number Guessing Game.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"

  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Instantiate a new Screen object
SQ = Game.new                #Instantiate a new Game object

$gameCount = 0
$noOfGuesses = 0
$totalNoOfGuesses = 0
$avgNoOfGuesses = 0

$maxChallengeRange = 1000
$maxGameGuesses = 10

$cheatMode = false

#Execute the Game class's display_greeting method
SQ.display_greeting

answer = ""

#Loop until the player enters y or n and do not accept any other input
loop do

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to start the game
  print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

  answer = STDIN.gets  #Collect the player's response
  answer.chop!  #Remove any extra characters appended to the string

  #Terminate the loop if valid input was provided
  break if answer == "y" || answer == "n"  || answer == "c" #Exit loop

end 

#Analyze the player's input
if answer == "n"  #See if the player elected not to take the game

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play the game some other time
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to play the game

  if answer == "c"
    $cheatMode = true
    print "Cheat Mode Activated"
  end

  #Execute the Game class's display_instructions method
  SQ.display_instructions

  loop do

    $gameCount = $gameCount + 1

    #Execute the Game class's play_game method 
    SQ.play_game

    $totalNoOfGuesses = $totalNoOfGuesses + $noOfGuesses
    $avgNoOfGuesses = $totalNoOfGuesses / $gameCount

    Console_Screen.cls
    print "Your Game Statitics:\n"
    print "------------------------------------------------\n"
    print "Games Played:\t\t\t\t\t" + $gameCount.to_s + "\n"
    print "Your Average Number of Guesses per Game:\t" + $avgNoOfGuesses.to_s 
    print "\n\nPress enter to continue."
    Console_Screen.pause #Clear the display area

    Console_Screen.cls

    #Prompt the player for permission start a new round of play
    print "Would you like to play again? (y/n): "

    playAgain = STDIN.gets  #Collect the player's response
    playAgain.chop!  #Remove any extra characters appended to the string
  
    break if playAgain == "n"  #Exit loop
  
  end
  
  #Call upon the Game class's determine_credits method in order to thank
  #the player for playing the game and to display game information
  SQ.display_credits
  
end


