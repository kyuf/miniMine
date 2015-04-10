#classy chess (interactive). currently on hold...

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
def drawBoard(space)
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
  puts "\n#{drawColumn}\n" 
end

#empty board array
space = Array.new(64, "  ")
drawBoard(space)

#define piece class
class Piece
  #assign color, position, and marker
  def initialize(color, position, marker)
    @color = color  #string: "white" or "black"
    @position = position  #array: [column, rank], column: "A"-"H", rank: 1-8
    @marker = marker  #char: "K", "Q", "R", "B", "K", "P"
  end
  
  #allow color, position, marker to be accessed
  def property(props)
    if props == "color"
      return @color
    elsif props =="position"
      return @position   #[0] for column, [1] for rank
    elsif props =="marker"
      return @marker
    end
  end
  
  #define ability to move
  def move(newPosition) #
    #allowable moves determined by moveset and position
    #determine legality from proposed new position: moveset(newPosition), return true or false
    #check for collision
    #check for check
    #check for checkmate
    #check for pin
    #update attacking squares
  end
  
end

#define king class
class King < Piece
  @moveCount = 0
  def moveset(position)
    #insert king moveset
    #check for castling
    #return array of possible moves
  end
end

#define queen class
class Queen < Piece
  def moveset(position)
    #insert queen moveset
    #return array of possible moves
  end
end

#define rook class
class Rook < Piece
  @moveCount = 0
  def moveset(position)
    #insert rook moveset
    #return array of possible moves
  end
end

#define bishop class
class Bishop < Piece
  def moveset(position)
    #insert bishop moveset
    #return array of possible moves
  end
end

#define knight class
class Knight < Piece
  def moveset(position)
    #insert knight moveset
    #return array of possible moves
  end
end

#define pawn class
class Pawn < Piece
  @moveCount = 0
  def moveset(position)
    #insert pawn moveset
    #check for 2 space first move
    if @moveCount == 0
      #allow 2 space move
    end
    #check for en passant
    #return array of possible moves
  end
  #check for promotion
  #flag for en passant upon moving 2 spaces. remove flag next turn
end