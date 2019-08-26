#--------------------------------------------------------------------------
# 
# Script Name: RubyJoke.rb
# Version: 2.0
# Author: Antone Cabral
# Org: Bellevue University WEB312-303J
# Assignment: Assignment 1.1
# Date: 8/25/19 (Updated)
# 
# Description: 
#   1. Updated Jokes
#   2. Add Five Additional Jokes
#   3. Add Copyright and Website - ("www.ACabral.com")
#   4. Update comments
#   5. Comment out all console clear functions except last instance
# 
#--------------------------------------------------------------------------


#--------------------------------------------------------------------------
# 
# Script Name: RubyJoke.rb
# Version: 1.0
# Author: Jerry Lee Ford, Jr.
# Date: March 2010
# 
# Description: This Ruby script tells a series of 5 humorous jokes
# 
#--------------------------------------------------------------------------



# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen
  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
  end
end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Initialize a new Screen object

#Execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#Prompt the player for permission to begin the game
puts "Would you like to hear a few funny jokes? (y/n)"

#Collect the player's response
answer = STDIN.gets

#Remove any extra characters appended to the string
answer.chop!

#Analyze the player's response
if answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play again
  puts "Sorry to hear that. Please return and play again soon."

else
  
  Console_Screen.cls  #Clear the display area

  ##################### CHANGE JOKES  8/25/19  ####################################
  #Jokes From - https://athlonsports.com/dad-jokes
  
  #Display the beginning of the first joke
  puts "What do you call cheese that isn't yours? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Nacho Cheese. (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls  #Clear the display area
 
  #Display the beginning of the second joke
  puts "What’s an astronaut’s favorite part of a computer? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "The space bar. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area
  
  #Display the beginning of the third joke
  puts "How does a penguin build it's house? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Igloos it together. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area
  
  #Display the beginning of the fourth joke
  puts "Why did the coffee file a police report? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "It got mugged! (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area
  
  #Display the beginning of the fifth joke
  puts "When does a joke become a dad joke? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "When it becomes apparent! (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls 

  #Display the beginning of the sixth joke
  puts "Did you hear about the restaurant on the moon? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Great food, no atmosphere. (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls 

  #Display the beginning of the seventh joke
  puts "Why do you never see elephants hiding in trees? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Because they're so good at it. (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls 

  #Display the beginning of the eighth joke
  puts "Why did the scarecrow win an award? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue
 
   #Display the punch line
   puts "Because he was outstanding in his field. (Press Enter)"
 
  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls 

  #Display the beginning of the ninth joke
  puts "Why don't skeletons ever go trick or treating? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue
 
  #Display the punch line
  puts "Because they have no body to go with. (Press Enter)"
  
  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls 
 
  #Display the beginning of the TENTH joke
  puts "What lies at the bottom of the ocean and twitches? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "A nervous wreck. (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  Console_Screen.cls  #Clear the display area

  puts "Thanks for playing the Ruby Joke game!"

  puts "Copyright 2019. www.ACabral.com."


end


