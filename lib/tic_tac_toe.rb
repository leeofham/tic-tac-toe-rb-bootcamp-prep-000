WIN_COMBINATIONS = [
                   [0, 1, 2],
                   [3, 4, 5],
                   [6, 7, 8],
                   [1, 4, 7],
                   [2, 5, 8],
                   [0, 3, 6],
                   [0, 4, 8],
                   [2, 4, 6]
                  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, player = "X")
  board[index] = player
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0

  board.each do |turn|
    if turn != " "
      counter += 1
    end
    end
    return counter
  end

def current_player(board)
  even_or_odd = turn_count(board) % 2

  even_or_odd == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end

def play(board)
  turn(board) until over(board)
  if over?(board) && won?(board)
    puts "Congratulations #{board[win_combination.first]} has won!"
  elsif draw?(board)
    puts "It's a draw!"
  end
end
