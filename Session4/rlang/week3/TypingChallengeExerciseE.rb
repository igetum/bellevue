#--------------------------------------------------------------------------
# 
# Script Name: TypingChallengeExerciseE.rb
# Version:     2.0
# Author:      Antone Cabral
# Date:        9/9/19
# 
# Description: Modified
#          Add 5 more sentence challenges
#          Updated scoring system to deliver a letter grade depending on points
#          Feedback after incorrect attempt displaying errors
#          Rejects blank inputs and loop until non-empty entry from player
#           
#--------------------------------------------------------------------------


#--------------------------------------------------------------------------
# 
# Script Name: TypingChallenge.rb
# Version:     1.0
# Author:      Jerry Lee Ford, Jr.
# Date:        March 2010
# 
# Description: This Ruby script demonstrates how to apply conditional logic 
#              in order to analyze user input and control script execution 
#              through the development of a computer typing test that
#              evaluates the player's typing skills.
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
                #execution until the player presses the Enter key
  end
  
end

#Define a class representing the typing test
class Test
 
  #This method displays the 8-ball greeting message
  def display_greeting
  
    Console_Screen.cls  #Clear the display area
  
    #Display a welcome screen
    print "\t\t  Welcome to the Ruby Typing Challenge game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue. \n\n: "
  
  Console_Screen.pause       #Pause the game

  end
 
  #Define a method to be used to present test instructions
  def display_instructions
    
    Console_Screen.cls       #Clear the display area
    puts "\t\t\tInstructions:\n\n"  #Display a heading

    #Display the game's instructions
    puts %Q{    This test consists of a series of 10 typing challenges. 
    The challenge sentences are presented one at a time. To respond 
    correctly, you must retype each sentence exactly as shown and press 
    the Enter key. Your grade will be displayed at the end of the test.

    You will be given a letter grade at the end of the test. Score a nine or
    higher is an \"A\", 8 is a \"B\", 7 is a \"C\", 6 is a \"D\", and anything below 
    is a failing grade. Good Luck!
    \n
    Press Enter to continue.\n\n}

    Console_Screen.pause       #Pause the game
    
  end
 
  #Define a method to be used to present typing challenges
  def present_test(challenge)
    while true
        Console_Screen.cls       #Clear the display area
        print challenge + "\n\n: "  #Display the challenge sentence
    
        result = STDIN.gets  #Collect the player's input
        result.chop!         #Remove the end of line marker
        break if result != ""
    end

    #Analyze the player input and see if it is correct
    if challenge == result then
    
      #Keep track of the number of correctly retyped challenge sentences
      $noRight += 1  
      Console_Screen.cls       #Clear the display area
      #Keep the player informed
      print "Correct!\n\nPress Enter to continue." 
      Console_Screen.pause       #Pause the game
      
    else  
    
      Console_Screen.cls       #Clear the display area
      #Keep the player informed


      print "Incorrect!\n\n"

      puts "Challenge sentence:\t" + challenge + "\n"
      puts "Your entry:\t\t" + result


      print "\n\nPress Enter to continue.\n"

      Console_Screen.pause       #Clear the game
      
    end
    
  end

  #Define a method to be used to display test results
  def determine_grade
  
    Console_Screen.cls       #Clear the display area  

    #To pass the test the player must correctly retype 3 sentences
    case $noRight
        when 9..10
            $resultGrade = "A"
        when 8
            $resultGrade = "B"
        when 7
            $resultGrade = "C"
        when 6
            $resultGrade = "D"
        else
            $resultGrade = "F"
    end

    if $noRight >= 6 then
    
      #Inform the player of the good news
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      print "You have passed the test with an " + $resultGrade.to_s + "!\n\nPress Enter to continue."
      
    else  #The player has failed the test
    
      #Inform the player of the bad news
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      print "You recieved an " + $resultGrade.to_s + ". You have failed the typing test!\n\nPress Enter to continue."
      
    end
    
  end

end


# Main Script Logic -------------------------------------------------------

#Initialize global variable that will be used to keep track of the number
#of correctly retyped sentences
$noRight = 0
$resultGrade = "F"

Console_Screen = Screen.new  #Instantiate a new Screen object
Typing_Test = Test.new        #Instantiate a new Test object

#Execute the Test object's display_greeting method
Typing_Test.display_greeting

#Execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#Prompt the player for permission to begin the test
print "Would you like to test your typing skills? (y/n)\n\n: "

answer = STDIN.gets  #Collect the player's response
answer.chop!  #Remove any extra characters appended to the string
  
#Loop until the player enters y or n and do not accept any other input.
until answer == "y" || answer == "n"

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to begin the test
  print "Would you like to test your typing skills? (y/n)\n\n: "

  answer = STDIN.gets  #Collect the player's response
  answer.chop!  #Remove any extra characters appended to the string

end 

#Analyze the player's response
if answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play again
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to take the test

  #Execute the Test object's display_instructions method
  Typing_Test.display_instructions
  
  #Display typing challenges and grade each answer by calling on the
  #Test object's present_test method
  Typing_Test.present_test "In the end there can be only one."
  Typing_Test.present_test "Once a great plague swept across the land."
  Typing_Test.present_test "Welcome to Ruby Principles of Ruby Programming"
  Typing_Test.present_test "There are very few problems in the world " +
  "that enough M&Ms cannot fix."
  Typing_Test.present_test "Perhaps today is a good day to die. Fight " +
  "beside me and let us die together."
  Typing_Test.present_test "What a beautiful day it is on the beach, here " + 
  "in beautiful and sunny Hawaii."
  Typing_Test.present_test "The two boys collected twigs outside, for " +
  "over an hour, in the freezing cold!"
  Typing_Test.present_test "The steamboats seemed to float down the " + 
  "Mississippi River at a snail’s pace."
  Typing_Test.present_test "Max Joykner sneakily drove his car around every " +
  "corner looking for his dog."
  Typing_Test.present_test "Please take your dog, Cali, out for a walk – he " + 
  "really needs some exercise!"

  #Notify the player of the results by executing the Test object's 
  #display_instructions method
  Typing_Test.determine_grade

  Console_Screen.pause       #Pause the game
  
  Console_Screen.cls  #Clear the display area
  #Thank the player for taking the typing test
  puts "Thank you for taking the Ruby Typing Challenge.\n\n"

end


