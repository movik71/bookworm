class HomeController < ApplicationController

  def index
    @words = Word.all
  end

  def log_in

  end

end