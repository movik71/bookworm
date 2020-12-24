include Devise::Controllers::Helpers

class HomeController < ApplicationController

  before_action :authenticate_user

  def index
  end

  def start
  end

end