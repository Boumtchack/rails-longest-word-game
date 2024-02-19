class GamesController < ApplicationController
  def new
    @letter_list = []
    alpha = ("A".."Z").to_a
    10.times do
      @letter_list << alpha.sample
    end
  end

  def score
  end
end
