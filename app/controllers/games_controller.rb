require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    generate_challenge
  end
  
  def generate_challenge
    number = Random.rand(5..10)
    alphabet = ('a'..'z').to_a
    @list = []
    number.times do |n|
      @list << alphabet.sample
    end
    @starttime = Time.new 
    return @list
  end

  def calculate_score(word)
    counter = word.size
    @time = @endtime - @starttime
    @score = counter*10/@time
  end

  def check
    @endtime = Time.new
    @word = params[:word]
    url = "https://dictionary.lewagon.com/#{@word}"
    check = URI.parse(url).read
    if JSON.parse(check)["found"]
      
    else
    end
      
  end
end
