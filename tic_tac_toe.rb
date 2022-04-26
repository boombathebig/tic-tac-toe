# Create player class, which stores player names 
class Player
    attr_reader :name 
    def initialize(name)
        puts "Please enter your display name #{name}"
        @name = gets.chomp
    end
end

# Create a method to display the Board 
# Create a Method that will take player 1's input and store it 
# Create a Method that will Tabulate the Result 


#Take Player Names, create Objects
Player1= Player.new('Player 1')
Player2= Player.new ('Player 2')
#Display Board 
# Take Player 1 Input
# Tabulate Result
# Display Result / Board
# Take Player 2 Input
# Tabulate Result
# Display Result / Board
# Repeat until victory or tie condition met
# Display Victory or Tie Message 
# Ask to Play Again 
# Reset Game 

