class HomeController < ApplicationController

  def index
    @words = Word.all
  end

  def start
    redirect_to action: 'game#start'
  end

end