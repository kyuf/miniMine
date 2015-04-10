#hangman

#create list of words to guess
keyList = ["pineapple", "banana", "computer science", "bacon and eggs"]

#test case will be the word 'Pineapple'
key = keyList[rand(keyList.length)]
lettersRemaining = key.length
badGuess = 0
guessedLetters = Hash.new
incorrectGuesses = []

#create hash to store position of letters in word
keyWord = Hash.new

for i in 0...key.length
  if keyWord[key[i]] == nil
    keyWord[key[i]] = [i]
  else
    keyWord[key[i]] << i
  end
end

#create array to indicate number of letters in word with underscores
progress = []

for i in 0...key.length
  if key[i] != " "
    progress << "_"
  else
    progress << "  "
    #remove spaces from counting towards win condition
    lettersRemaining -= 1
  end
end

#welcome screen
system('clear') #clearscreen
puts "Welcome to kyuf's hangman."
puts "You will be allowed 6 incorrect guesses before your man is hanged."
puts "Press Enter to continue"
gets.chomp

#print array function. takes in array and prints each element seperated by a space
def printSpaceArray(array)
  for i in array
    print i + " "
  end
  puts "\n"
end

#draw hangman function. takes badGuess as input and prints out current condition of hangman
def drawHangman(badGuess)  
  if badGuess == 0
    puts "\n\n\n\n"
  else
    hangArray = [" O\n", "/", "|", "\\\n", "/", " \\"]
    for i in 0...badGuess
      print hangArray[i]
    end
    #spacing asthetics
    if badGuess < 4
      puts "\n\n\n"
    elsif badGuess < 6
      puts "\n\n"
    else
      puts "\n"
    end      
  end
end

#main game
while lettersRemaining != 0 && badGuess != 6
  #clearscreen
  system('clear')
  #draw hangman
  drawHangman(badGuess)  
  #print progress
  printSpaceArray(progress)
  #print incorrect guesses
  print "Incorrect Guesses: "
  printSpaceArray(incorrectGuesses)
  #prompt and receive user guess
  puts "Guess a letter: "
  letter = gets.chomp
  #check if guess is valid
  while letter.length != 1
    puts "Invalid guess. Guess a letter please"
    letter = gets.chomp
  end
  #check if letter has been guessed before
  while guessedLetters[letter] != nil
    puts "You have already guessed #{letter}. Please guess another letter"
    letter = gets.chomp
  end
  guessedLetters[letter] = 0
  #update solving progress
  if keyWord[letter] != nil
    for i in keyWord[letter]
      progress[i] = letter + " "
      lettersRemaining -= 1
    end
  else
    #update incorrect guesses if guess is incorrect
    badGuess += 1
    incorrectGuesses << letter
  end
end

#end game conditions
if lettersRemaining == 0
  system('clear') #clearscreen
  printSpaceArray(progress)
  puts "Congrats! You Won!"
else
  system('clear') #clearscreen
  drawHangman(badGuess)
  puts "You lost!"
end