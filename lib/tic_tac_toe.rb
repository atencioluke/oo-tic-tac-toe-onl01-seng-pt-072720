class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
  
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
  
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      cp = current_player
  
      if valid_move?(index)
        move(index, cp)
        display_board
      else
        turn
      end
    end
  
    def input_to_index(input)
      input.to_i - 1
    end
  
    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
    end
  
    def valid_move?(index)
      if position_taken?(index)
       #  execute code if position taken is true
       false
     else
       # execute code if position take is false
       if index.between?(0,8)
         true
       else
         false
       end
      end
   end
  
    def move(index, token)
      @board[index] = token
    end
  
    def won?
      WIN_COMBINATIONS.find do |indices|
        values = @board.values_at(*indices)
        values.all?('X') || values.all?('O')
      end
    end
  
    def full?
      @board.all? { |i| i == "X" || i == "O" }
    end
  
    def draw?
      if won? || !full?
        false
      else
        true
      end
    end
  
    def over?
       if draw? || won? || full?
         return true
       end
    end
  
    def winner
       if won?
          return @board[won?[0]]
       end
    end
  
    def play
      turn until over?
      won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    end
  
    def current_player
      @token = turn_count % 2 == 0 ? "X" : "O"
      @token
    end
  
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  end