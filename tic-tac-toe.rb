#Tic-Tac-Toe

#create game board
=begin
     |     |
  7  |  8  |  9 
_____|_____|_____
     |     |
  4  |  5  |  6 
_____|_____|_____
     |     |
  1  |  2  |  3
     |     |
=end
def drawBoard(marks)
  system('clear')
=begin
  puts "\n     |     |"
  puts "  #{marks[7]}  |  #{marks[8]}  |  #{marks[9]}"
  puts "_____|_____|_____"
  puts "     |     |"
  puts "  #{marks[4]}  |  #{marks[5]}  |  #{marks[6]}"
  puts "_____|_____|_____"
  puts "     |     |"
  puts "  #{marks[1]}  |  #{marks[2]}  |  #{marks[3]}"
  puts "     |     |\n"
=end
  puts "\n"
  drawMark = [7, 8, 9]
  for i in 0..2
    puts "     |     |"
    puts "  #{marks[drawMark[0]]}  |  #{marks[drawMark[1]]}  |  #{marks[drawMark[2]]}"
    if i != 2
      puts "_____|_____|_____"
    end
    for j in 0..2
      drawMark[j] -= 3
    end
  end
  puts "     |     |\n"
end

#create initial mark array
marks = Array.new(10, " ")
win = 0
turn = 1

#define valid input check
def validInput(marks, space)
  #check if input is a valid option
  while space < 1 || space > 9
    print "Invalid input. Please enter another space: "
    space = gets.chomp.to_i
  end
  #check if space is available
  while marks[space] == "X" || marks[space] == "O"
    print "Space already taken. Please enter another space: "
    space = gets.chomp.to_i
  end
  return space
end

#define win condition
def winCondition(marks, player)
  if marks[1] == marks[2] && marks[2] == marks[3] && marks[1] == player
    return player
  elsif marks[4] == marks[5] && marks[5] == marks[6] && marks[4] == player
    return player
  elsif marks[7] == marks[8] && marks[8] == marks[9] && marks[7] == player
    return player
  elsif marks[1] == marks[4] && marks[4] == marks[7] && marks[1] == player
    return player
  elsif marks[2] == marks[5] && marks[5] == marks[8] && marks[2] == player
    return player
  elsif marks[3] == marks[6] && marks[6] == marks[9] && marks[3] == player
    return player
  elsif marks[1] == marks[5] && marks[5] == marks[9] && marks[1] == player
    return player
  elsif marks[3] == marks[5] && marks[5] == marks[7] && marks[3] == player
    return player
  else
    return 0
  end
end

#main game
while win == 0
  
  #cats game condition
  if turn == 10
    win = 1
    break
  end
  
  #update board
  drawBoard(marks)
  
  #X turn on odd turns and O turn on even turns
  if turn % 2 != 0
    player = "X"
  else
    player = "O"
  end
  
  #prompt input
  print "#{player}'s turn. Select space (1-9. Use numpad for reference): "
  space = gets.chomp.to_i
  #check for valid input
  space = validInput(marks, space)
  #assign space with X
  marks[space] = player
  #check win condition from 5th turn onwards
  if turn >= 5
    win = winCondition(marks, player)
  end
  #increment turn counter
  turn += 1
end

#declare winner
drawBoard(marks)
if win != 1
  puts "#{win} has won! Three in a row!"
else
  puts "Kitty has won the game!"
end