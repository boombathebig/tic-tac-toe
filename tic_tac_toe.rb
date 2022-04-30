
class Player
  attr_accessor :round_selections, :name, :win_conditions, :player_symbol, :win

  def initialize(name, symbol)
    puts "#{name}, please put in your display name"
    @name = gets.chomp
    @player_symbol = symbol
    @round_selections = []
    @win_conditions = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
    @win = false
  end

  def select_space
    puts "#{self.name}, please enter the symbol of the space which you would like to occupy"
    selection = gets.to_i
        if $game_board.spaces.include?(selection)
        self.round_selections.push(selection)
        $game_board.spaces[selection -1] = @player_symbol
        puts "#{self.name}, you chose space #{selection}"
        else
            select_space()
        end
    end

    def win?(player)
        win_conditions.each do|condition|
            if (player.round_selections.include?(condition[0]) &
                player.round_selections.include?(condition[1]) &
                player.round_selections.include?(condition[2]))
                self.win = true
                puts "#{self.name}, you did it!! ULTIMATE VICTORY"
            end

        end
    end
    def take_turn()
        $game_board.display_board
        self.select_space
    end
end

class Board

    attr_accessor :spaces, :tie

    def initialize()
        @spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @tie = false
    
    end

    def display_board()
        puts " #{spaces[0]} | #{spaces[1]} | #{spaces[2]}  "
        puts '---+---+---'
        puts " #{spaces[3]} | #{spaces[4]} | #{spaces[5]}  "
        puts '---+---+---'
        puts " #{spaces[6]} | #{spaces[7]} | #{spaces[8]}  "
    end

    def tie?()
        if $game_board.spaces.none?(Integer)
            self.tie = true
            puts "It's a Tie :("
        end
    end 
        

end
def new_round
    i=1
    until $player1.win == true || $player2.win ==true || $game_board.tie == true 
        if i.odd? && $game_board.tie == false
                $player1.take_turn
                i+= 1
                $player1.win?($player1)
                $game_board.tie?()
        end
        if i.even? && $player1.win == false && $game_board.tie == false
                $player2.take_turn
                i+= 1
                $player2.win?($player2)
                $game_board.tie?()
        end
    end
end
    
def new_game()
    $player1 = Player.new("Player 1", "X")
    $player2 = Player.new("Player 2", "O")
    $game_board = Board.new
    new_round()
    play_again?()
end
def play_again?()
    puts "Would you like to play again? y/n?"
    response = gets.chomp.downcase
    if response == "y"
        new_game()
    elsif response == "n"
        puts "Thanks for playing!"
    else 
        puts "Invalid Entry, please enter y or n."
        play_again?()
    end
end

new_game()



