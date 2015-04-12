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

#define target push checker. determines if space is available for push
#input is space[finalSpace]
def validPush(targetPush)
  if targetPush != "  "
    return false
  end
end

#define target capture checker. determines if space is available for capture
#input is space[finalSpace]
def validCapture(targetCapture, mark)
  if targetCapture[0] == mark or targetCapture == "  "
    return false
  end
end

#define move function. returns multidimensional with legality and spaces to be updated
#move(notation)[0] is [boolean]
#move(notation)[1] is space
def move(notation, space, player, enPassant) #takes in PGN notation, space, player color, en passant flag
  #allowable moves determined by moveset and position
  #determine legality from proposed new position: moveset(notation), return true or false
  #check for collision
  #check for check
  #check for checkmate
  #check for pin
  #update attacking squares
  
  #assign proper mark based on player color
  if player == "White"
    mark = "w"
  else
    mark = "b"
  end
  
  #push pawn
  flagDouble = false
  if notation.length == 2
    finalSpace = noteToSpace(notation)
    
    #check if push is valid
    if validPush(space[finalSpace]) == false
      return [false]
    end
    
    #calcultations based off mark
    if mark == "w"
      if notation[1] == 1 or notation[1] == 2
        return [false]
      end
      sign = 8
      front = "4"
    else
      if notation[1] == 7 or notation[1] == 8
        return [false]
      end
      sign = -8
      front = "5"
    end
    
    initialSpace = finalSpace - sign
    if space[initialSpace] == "#{mark}P"
    elsif space[initialSpace] == "  " and notation[1] == front and space[initialSpace - sign] == "#{mark}P"
      initialSpace -= sign
      flagDouble = true
    else
      return [false]
    end
    space[finalSpace] = "#{mark}P"
    space[initialSpace] = "  "
  end
  
  #pawn capture
  if notation[1] == "x" and notation[0] == notation[0].downcase
    finalSpace = noteToSpace(notation[2] + notation[3])
    
    #flag for en passant first
    flagEnPassant = enPassant[2] - enPassant[1] == 1 ? true : false
    
    #check if valid capture
    if validCapture(space[finalSpace], mark) == false and flagEnPassant == false
      puts "Invalid capture"
      return [false]
    end
    
    #check if columns of initial and final spaces are adjacent
    adjCol = notation[2].ord - notation[0].ord
    if adjCol.abs != 1
      puts "Not adjacent"
      return [false]
    end
    
    #calculations based off mark
    if mark == "w"
      sign = 8
    else
      sign = -8
    end
    
    initialSpace = finalSpace - sign - adjCol
    #normal capture calculation
    if space[initialSpace] == "#{mark}P"
      space[initialSpace] = "  "
      space[finalSpace] = "#{mark}P"
    else
      puts "Pawn not found"
      return [false]
    end    
    #en passant calculation
    if flagEnPassant == true
      if finalSpace - sign == enPassant[0] and enPassant[2] - enPassant[1] == 1
        space[enPassant[0]] = "  "
      else
        puts "En Passant fail"
        return [false]
      end
    end
  end
  
  if flagDouble == false
    return [true, space]
  else
    return [true, space, finalSpace]
  end

end

#main game
def playChess
  #draw starting board
  space = startSpace
  #en passant array has [vulnearable pawn space, vulnearble turn, current turn]
  enPassant = Array.new(3, 0)
  turn = 1
  while true
    drawBoard(space)
    enPassant[2] = turn
    if turn % 2 == 1
      player = "White"
    else
      player = "Black"
    end
    print "#{player} to play: "
    notation = gets.chomp
    
    #moveMe can store 3 possibillities
    #invalid move: moveMe = [false]
    #valid move: moveMe = [true, space array]
    #en passant flag: moveMe = [true, space array, pawn space]
    moveMe = move(notation, space, player, enPassant)
      while moveMe[0] == false
        print "Invalid notation. Please enter again: "
        notation = gets.chomp
        moveMe = move(notation, space, player, enPassant)
      end
    
    #if en passant flag, store vulnerable pawn space and turn number
    if moveMe.length == 3
      enPassant[0] = moveMe[2]
      enPassant[1] = turn
    end
    turn += 1
  end
end

#play
playChess