#--------------------------------------------------------------------------
# 
# Script Name: SupermanQuiz.rb
# Version:     2.0
# Author:      Antone Cabral
# Date:        September 20, 2019
# 
# Description: Updated Program
#     1.  Added 5 more questions. 
#         Source: https://www.usefultrivia.com/comic_book_trivia/superman_trivia_index.html
#     2.  Added retake logic if user failed
#     3.  Updated credits to be displayed if user decides not to take quiz
#     4.  Added Wiki link for user's that failed to help get source for answers
#     5.  Added a disp_scale method to allow users to see grading system.
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
# 
# Script Name: SupermanQuiz.rb
# Version:     1.0
# Author:      Jerry Lee Ford, Jr.
# Date:        March 2010
# 
# Description: This Ruby script demonstrates how to work with loops when 
#              collecting user input through the creation of an 
#              interactive quiz that evaluates the player�s knowledge of
#              the Superman movie series.
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

#Define a class representing the Superman Movie Trivia Quiz
class Quiz
 
  #This method displays the quiz's opening screen
  def display_greeting
  
    Console_Screen.cls  #Clear the display area
  
    #Display welcome message
    print "\t\t  Welcome to the Superman Movie Trivia Quiz!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."
  
    Console_Screen.pause       #Pause the game

  end
 
  #Define a method to be used to present quiz instructions
  def display_instructions

    loop do
    
      Console_Screen.cls       #Clear the display area
      puts "INSTRUCTIONS:\n\n"  #Display a heading

      #Display the game's instructions
      puts "You will be presented with a series of multiple-choice" 
      puts "questions. To answer a question, type in the letter of"
      puts "the corresponding answer and press the Enter key. Your"
      puts "grade will be displayed at the end of the test.\n\n\n"
      puts "Good luck!\n\n\n"

      puts "To view the grading scale enter (s)"
      puts "Enter any key to start quiz."
  
      answer = STDIN.gets  #Collect the player's response
      answer.chop!  #Remove one character from the end of the string
  
      if answer == "s" then
        SQ.disp_scale
      else
        break
      end
  
    end 

    
  end
 
  #Define a method to be used to present and process quiz questions
  def disp_q(question, q_A, q_B, q_C, q_D, answer)

    #Loop until the player inputs a valid answer
    loop do
  
      Console_Screen.cls       #Clear the display area
    
      #Format the display of the quiz question
      puts question + "\n\n"
      puts q_A
      puts q_B
      puts q_C
      puts q_D
      print "\nType the letter representing your answer: "
    
      reply = STDIN.gets  #Collect the player's answer
      reply.chop!         #Remove the end of line marker
    
      #Analyze the player's input to determine if it is correct
      if answer == reply then
        
        #Keep track of the number of correctly answered questions
        $noRight += 1  
        
      end
      
      #Analyze the answer to determine if it was valid
      if reply == "a" or reply == "b" or reply == "c" or reply == "d" then
    
        break  #Terminate the execution of the loop
    
      end
     
    end

  end

  #Define a method to be used to grade and display quiz results
  def determine_grade
  
    Console_Screen.cls       #Clear the display area  
  
    #To pass the test, the player must correctly answer at least 3 questions
    if $noRight >= 6 then
    
      #Inform the player of the good news and assign a ranking
      print "You correctly answered " + $noRight.to_s + " question(s). "
      puts "You have passed the \nSuperman Movie Trivia Quiz!\n\n"
      puts "You have earned a rank of: Good Citizen" if $noRight >= 6 && $noRight <= 7
      puts "You have earned a rank of: Side Kick" if $noRight >= 8 && $noRight <= 9
      puts "You have earned a rank of: Superhero" if $noRight == 10
      print "\n\nPress Enter to continue."
      
    else  #The player has failed the quiz
    
      #Inform the player of the bad news
      print "You missed " + (10 - $noRight).to_s + " questions. "
      puts "You have failed the Superman Movie Trivia Quiz."
      puts "Perhaps you should watch the movies again before returning to"
      puts "retake the quiz.\n"
      puts "Another source for answers is with Wikipedia."
      puts "http://en.wikipedia.org/wiki/Superman_movies"
      print "\n\nPress Enter to continue."
      
    end
    
    Console_Screen.pause       #Pause the game
    
  end

  #This method displays the information about the Superman Movie Trivia Quiz
  def display_credits
  
    Console_Screen.cls  #Clear the display area
  
    #Thank the player and display game information
    puts "\t\tThank you for taking the SUPERMAN MOVIE TRIVIA QUIZ.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"

  end

  def disp_scale

    Console_Screen.cls  
    puts "GRADE SCALE:\n\n"  #Display a heading
    puts "You pass the trivia when you answer 6 or more questions correctly."
    puts "Grade Scale:"
    puts "\t5 or Less: Fail"
    puts "\t6 to 7 Correct: Pass with title \"Good Citizen\"."
    puts "\t8 to 9 Correct: Pass with title \"Side Kick\"."
    puts "\t10 Correct: Pass with title \"Superman\"."

    puts "\n\nPress enter to continue."
    Console_Screen.pause 
  end

end


# Main Script Logic -------------------------------------------------------

#Initialize global variable that will be used to keep track of the number
#of correctly answered quiz questions
$noRight = 0

Console_Screen = Screen.new  #Instantiate a new Screen object
SQ = Quiz.new     #Instantiate a new Quiz object

#Execute the Quiz class's display_greeting method
SQ.display_greeting

answer = ""

loop do

  #Loop until the player enters y or n and do not accept any other input.
  loop do

    Console_Screen.cls  #Clear the display area

    #Prompt the player for permission to start the quiz
    print "Are you ready to take the quiz? (y/n): "

    answer = STDIN.gets  #Collect the player's response
    answer.chop!  #Remove one character from the end of the string

    break if answer == "y" || answer == "n" 

  end 

  #Analyze the player's input
  if answer == "n"  #See if the player elected not to take the quiz

    Console_Screen.cls  #Clear the display area

    #Invite the player to return and take the quiz some other time
    puts "Okay, perhaps another time.\n\n"

    Console_Screen.pause
    Console_Screen.cls

    SQ.display_credits

    Console_Screen.pause
    Console_Screen.cls

    $noRight = 10 #Cancel out the Retake Quiz Loop

  else  #The player wants to take the quiz

    #Execute the Quiz class's display_instructions method
    SQ.display_instructions
    
    #Execute the Quiz class's disp_q method and pass it 
    #arguments representing a question, possible answers and the letter 
    #of the correct answer


    SQ.disp_q("What is the name of the Daily Planet's ace photographer?",
    "a. Jimmy Olsen", "b. Clark Kent", "c. Lex Luthor", "d. Lois Lane", 
    "a")
    
    #Call upon the disp_q method and pass it the second question
    SQ.disp_q("What is the name of Clark Kent's home town?",
    "a. Metropolis", "b. Gotham City", "c. Smallville", "d. New York", 
    "c")
    
    #Call upon the disp_q method and pass it the third question
    SQ.disp_q("In which movie did Superman battle General Zod?",
    "a. Superman", "b. Superman II", "c. Superman III", "d. Superman IV", 
    "b")
    
    #Call upon the disp_q method and pass it the fourth question
    SQ.disp_q("What is the name of Superman's father?",
    "a. Nimo", "b. Jarrell", "c. Lex Luthor", "d. Krypton", 
    "b")
    
    #Call upon the disp_q method and pass it the fifth question
    SQ.disp_q("Where had Superman been at the start of 'Superman Returns'?",
    "a. Moon", "b. Fortress of Solitude", "c. Earth's Core", "d. Krypton", 
    "d")

    # #ADDED NEW QUESTIONS __________________________________________________________

    #Call upon the disp_q method and pass it the sixth question
    SQ.disp_q("What is Clark Kent's middle name?",
      "a. Thomas", "b. Jacob", "c. Walter", "d. Joseph", 
      "d")

    #Call upon the disp_q method and pass it the seventh question
    SQ.disp_q("What is Superman's Kryptonian name?",
      "a. Zor-el", "b. Jimbo", "c. Jor-el", "d. Kal-el", 
      "d")
    
    #Call upon the disp_q method and pass it the eighth question
    SQ.disp_q("What was the name of Superman's birth mother?",
    "a. Lara", "b. Kara", "c. Xala", "d. Faora", 
    "a")

    #Call upon the disp_q method and pass it the nineth question
    SQ.disp_q("What was the first newspaper Clark Kent worked for?",
      "a. Dailey Bugle", "b. Daily Star", "c. Daily Planet", "d. Cleaveland Evening News", 
      "d")

    #Call upon the disp_q method and pass it the tenth question
    SQ.disp_q("What is Clark Kent's adopted mother's name?",
      "a. Martha", "b. Lara", "c. Lana", "d. Mary", 
      "b")
    
    #Call upon the Quiz class's determine_grade method to display
    #the player's grade and assigned rank
    SQ.determine_grade
    
    #Call upon the Quiz class's display_credits method to thank
    #the player for taking the quiz and to display game information
    SQ.display_credits
    
  end

  if $noRight <= 5 then

    Console_Screen.cls  #Clear the display area

    #Prompt the player for permission to start the quiz
    print "Retake Quiz? (y/n): "

    answer = STDIN.gets  #Collect the player's response
    answer.chop!  #Remove one character from the end of the string

    if answer == "n" then
      SQ.display_credits
      break
    end

  else

    break

  end

end