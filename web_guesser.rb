# Guess class created
class Guess
    @@count = 6
    def initialize(guess)
        @guess = guess
        @@count -= 1
    end
    
    def self.count
        @@count
    end
    
    def to_i
        @guess
    end
end
require 'sinatra'
require 'sinatra/reloader'

Guess.new(0)

$SECRET_NUMBER = rand(100)

get '/' do 
    guess = Guess.new(params[:guess].to_i)
    message = check_guess(guess)
    erb :index, :locals => {:number => $SECRET_NUMBER, :message => message, 
                            :color => @color, :guess => guess, :count => @@count-1}
end

def check_guess(guess)
    x = guess.to_i
    if Guess.count 
        if Guess.count == 0
            @@count = 6
            $SECRET_NUMBER = rand(100)
            @color2 = "blue"
            "You lost it! New SECRET NUMBER has been reset!!"
        else
            if x > $SECRET_NUMBER
                if x > $SECRET_NUMBER + 5
                    @color = "red"
                    "Way too high!"
                else
                    @color ="yellow"
                    "Too high!"
                end
            elsif x < $SECRET_NUMBER
                if x < $SECRET_NUMBER - 5
                    @color = "red"
                    "Way too low!"
                else
                    @color = "yellow"
                    "Too low!"
                end
            else
                $SECRET_NUMBER = rand(100)
                @@count = 6
                @color = "green"
                "You WON!"
            end
        end
    end
end










