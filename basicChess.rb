#basic chess

#game board
=begin
        A     B     C     D     E     F     G     H
      _______________________________________________
     |     |     |     |     |     |     |     |     |
  8  |  56 |  57 |  58 |  59 |  60 |  61 |  62 |  63 |  8
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  7  |  48 |  49 |  50 |  51 |  52 |  53 |  54 |  55 |  7
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  6  |  40 |  41 |  42 |  43 |  44 |  45 |  46 |  47 |  6
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  5  |  32 |  33 |  34 |  35 |  36 |  37 |  38 |  39 |  5
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  4  |  24 |  25 |  26 |  27 |  28 |  29 |  30 |  31 |  4
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  3  |  16 |  17 |  18 |  19 |  20 |  21 |  22 |  23 |  3
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  2  |  8  |  9  |  10 |  11 |  12 |  13 |  14 |  15 |  2
     |_____|_____|_____|_____|_____|_____|_____|_____|
     |     |     |     |     |     |     |     |     |
  1  |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  1
     |_____|_____|_____|_____|_____|_____|_____|_____|

        A     B     C     D     E     F     G     H
=end

#draw board
def drawBoard(space) #takes in array with current occupation of spaces
  system("clear")
  drawColumn = "        A     B     C     D     E     F     G     H"
  puts "\n#{drawColumn}"
  puts "      _______________________________________________"  
  drawSpace = [56, 57, 58, 59, 60, 61, 62, 63]
  drawRank = 8
  for i in 0..7
    puts "     |     |     |     |     |     |     |     |     |"
    puts "  #{drawRank}  |  #{space[drawSpace[0]]} |  #{space[drawSpace[1]]} |  #{space[drawSpace[2]]} |  #{space[drawSpace[3]]} |  #{space[drawSpace[4]]} |  #{space[drawSpace[5]]} |  #{space[drawSpace[6]]} |  #{space[drawSpace[7]]} |  #{drawRank}"
    puts "     |_____|_____|_____|_____|_____|_____|_____|_____|"
    for j in 0..7
      drawSpace[j] -= 8
    end
    drawRank -= 1
  end  
  puts "\n#{drawColumn}\n\n" 
end

#create starting spaces
def startSpace
  space = Array.new(64, "  ")
  #populate white pawns
  for i in 8..15
    space[i] = "wP"
  end
  #populate rooks
  for i in [0, 7, 56, 63]
    space[i] = "wR"
  end
  #populate knights
  for i in [1, 6, 57, 62]
    space[i] = "wN"
  end
  #populate bishops
  for i in [2, 5, 58, 61]
    space[i] = "wB"
  end
  #populate queens
  for i in [3, 59]
    space[i] = "wQ"
  end
  #populate kings
  for i in [4, 60]
    space[i] = "wK"
  end
  #make pieces on rank 8 black
  for i in 56..63
    space[i][0] = "b"
  end 
  #populate black pawns
  for i in 48..55
    space[i] = "bP"  
  end
  return space
end

#define conversion of notation space to number space
def noteToSpace(note)
  return (note[0].ord - 97) + 8 * (note[1].to_i - 1)
end

#define move function. returns multidimensional with legality and spaces to be updated
#move(notation)[0] is [boolean]
#move(notation)[1] is space
def move(notation, space, player) #takes in PGN notation, space, and player color
  #allowable moves determined by moveset and position
  #determine legality from proposed new position: moveset(notation), return true or false
  
  #push pawn
  if notation.length == 2
    finalSpace = noteToSpace(notation)
    #check if final space is available
    if space[finalSpace] != "  "
      return [false]
    end
    #calcultations based off player color
    if player == "White"
      if notation[1] == 1 or notation[1] == 2
        return [false]
      end
      sign = 1
      mark = "w"
      front = "4"
    else
      if notation[1] == 7 or notation[1] == 8
        return [false]
      end
      sign = -1
      mark = "b"
      front = "5"
    end
    
    initialSpace = finalSpace - sign * 8
    if space[initialSpace] == "#{mark}P"
    elsif space[initialSpace] == "  " and notation[1] == front and space[initialSpace - sign * 8] == "#{mark}P"
      initialSpace -= sign * 8
    else
      return [false]
    end
    space[finalSpace] = "#{mark}P"
    space[initialSpace] = "  "
  end
  #check for collision
  #check for check
  #check for checkmate
  #check for pin
  #update attacking squares

  return [true, space]  

end

#main game
def playChess
  #draw starting board
  space = startSpace
  turn = 1
  while true
    drawBoard(space)
    if turn % 2 == 1
      player = "White"
    else
      player = "Black"
    end
    print "#{player} to play: "
    notation = gets.chomp
    moveMe = move(notation, space, player)
      while moveMe[0] == false
        print "Invalid notation. Please enter again: "
        notation = gets.chomp
        moveMe = move(notation, space, player)
      end
    turn += 1
  end
end

#play
playChess