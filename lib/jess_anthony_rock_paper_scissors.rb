require "jess_anthony_rock_paper_scissors/version"


module JessAnthonyRockPaperScissors
  class RockPaperScissors

    def initialize
      @options = {"rock" => {lose: "paper", win: "scissors", value: "rock"},
        "paper" => {lose: "scissors", win: "rock", value: "paper"},
        "scissors" => {lose: "rock", win: "paper", value: "scissors"}
      }
    end

    def valid?(input)
      return true if input == "yes" || input == "no"
      puts "Invalid input"
      return false
    end

    def play
      puts "Welcome to rock-paper-scissors!"
      begin
        puts "Play with two players? (yes/no)"
        self.players = gets.chomp.downcase
      end until valid?(players)
      self.player1 = pick
      if players == "yes"
        self.player2 = options[pick]
      else
        self.player2 = computer
      end
      compare
    end

    def computer
      option_values = ["rock", "paper", "scissors"]
      options[option_values[rand(2)]]
    end

    def pick
      choice = nil
      until options.include? choice
        puts "Enter \"rock\", \"paper\", or \"scissors\""
        choice = gets.chomp.downcase
      end
      return choice
    end

    def compare
      if player1 == player2[:win]
        puts "#{ player2[:value] } beats #{ player1 }... Player 1 loses!"
      elsif player1 == player2[:lose]
        puts "#{ player1 } beats #{ player2[:value] }... Player 1 wins!"
      else
        puts "Tie Game"
        play
      end
    end

    private
      attr_reader :options
      attr_accessor :players, :player1, :player2
  end
end
