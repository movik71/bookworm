class HomeController < ApplicationController

  def index
    @words = Word.all
  end

  def start
  end

end