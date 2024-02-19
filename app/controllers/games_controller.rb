require 'open-uri'

# oui
class GamesController < ApplicationController
  def new
    @letter_list = []
    alpha = ('A'..'Z').to_a
    10.times do
      @letter_list << alpha.sample
    end
  end

  def score
    @word = params[:word].upcase.chars
    @letters = params[:letters].upcase.chars - [' ']
    if try_letters(@word, @letters)
      try_word
    else
      @result = 'wrong letters'
    end
  end

  def try_word
    found = parse['found']
    @result = "word doesn't exist in english dictionary"
    @result = 'word found' if found
  end

  def try_letters(word, letters)
    (word - letters).empty? && (letters - word).length <= (10 - word.length)
  end

  def parse
    JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read)
  end
end
