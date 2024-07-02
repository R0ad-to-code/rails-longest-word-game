require "json"
require "open-uri"

class GameController < ApplicationController

  def display
    @letters = []
    @length = (2..15).to_a.sample
    @length.times { @letters.push(('A'..'Z').to_a.sample) }
    @all_letters = @letters.join()
    puts @all_letters
  end

  def result

    @word = params[:result]
    @letters = params[:letters]
    if (@word.upcase.split("").sort - @letters.split("").sort).empty?
      @word_check = 1
      url = "https://dictionary.lewagon.com/#{@word}"
      result_serialized = URI.open(url).read
      @results = JSON.parse(result_serialized)
    else
      @word_check = 0
    end


  end
end
