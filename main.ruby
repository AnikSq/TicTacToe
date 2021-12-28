

require "byebug"
class TicTacToe
    attr_reader :array
    def initialize(name)
        @name = name
        @array = Array.new(3) {Array.new(3," ")}
    end

    def showGrid
        @array.each do |ele|
            puts "#{ele}"
            puts
        end
    end

    def empty?
        index_array = []
        @array.each_with_index do |ele,index|
            ele.each_with_index {|second_ele , second_index| index_array.push([index,second_index])  if second_ele == " " }
        end
        if index_array.flatten.empty?
            puts "it's a Tie , Game Over!"
            return true
        end
    end

    def computerPlay
        sleep 0.5
        index_array = []
        @array.each_with_index do |ele,index|
            ele.each_with_index {|second_ele , second_index| index_array.push([index,second_index])  if second_ele == " " }
        end
        if index_array.empty?
            return false
        else
            sample = index_array.sample
            index = sample[0]
            second_index = sample[1]
            puts "Computer Move"
            @array[index][second_index] = "O"
        end
    end

    def player
        puts "Human Move"
        puts "Give me which Row"
        row = (gets.chomp.to_i) - 1
        unless row >= 0 && row <= 2
            puts "Invalid Row"
            row = gets.chomp.to_i
        end
        puts "Give me which column"
        column = (gets.chomp.to_i) - 1
        unless column >= 0 && column <= 2
            puts "Invalid Column"
            column = gets.chomp.to_i
        end
        if @array[row][column] == " "
            @array[row][column] = "X"
        else
            puts "---------"
            puts "Occupied Space, Stupid Mortal!"
            puts "--------"
            showGrid
            player
        end
    end

    def winCondition(choice)
        if  (@array[0][0] == "#{choice}" && @array[0][1] == "#{choice}" && @array[0][2]=="#{choice}") ||
            (@array[1][0] == "#{choice}" && @array[1][1] == "#{choice}" && @array[1][2]=="#{choice}") ||
            (@array[2][0] == "#{choice}" && @array[2][1] == "#{choice}" && @array[2][2]=="#{choice}") ||
            (@array[0][0] == "#{choice}" && @array[0][1] == "#{choice}" && @array[0][2]=="#{choice}") ||
            (@array[0][0] == "#{choice}" && @array[1][0] == "#{choice}" && @array[2][0]=="#{choice}") ||
            (@array[0][1] == "#{choice}" && @array[1][1] == "#{choice}" && @array[2][1]=="#{choice}") ||
            (@array[0][2] == "#{choice}" && @array[1][2] == "#{choice}" && @array[2][2]=="#{choice}") ||
            (@array[0][0] == "#{choice}" && @array[1][1] == "#{choice}" && @array[2][2]=="#{choice}") ||
            (@array[0][2] == "#{choice}" && @array[1][1] == "#{choice}" && @array[2][0]=="#{choice}") 
            if choice == "X"
                puts "#{@name} Won!"
                return true
            else
                choice == "O"
                puts "Computer Won"
                return true
            end
        end
    end

    def playGame
        until winCondition("X") == true || winCondition("O") == true || empty? == true
        showGrid
        player
        computerPlay
        end
    end

    private
    def welcome
        puts "Hello, adventurer, What would be your name be?"
        sleep 1.5
        puts "Let me check from my glasses of glass"
        sleep 1.2
        puts "Ohh you already said, My bad Woops!"
        sleep 1.1
        puts "Your name is #{@name}"
        sleep 0.7
        puts "Let's get this game started!" 
        sleep 0.5
        puts "Tip: You are playing as X and the computer is playing as O"
    end

 


end






puts ("What is your name?")
name = gets.chomp
tac = TicTacToe.new("#{name}")
 tac.playGame
