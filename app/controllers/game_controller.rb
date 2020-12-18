class GameController < ApplicationController

  NUMBERS_TO_LETTERS = {"1" => 'А', "2" => 'Б', "3" => 'В', "4" => 'Г', "5" => 'Д', "6" => 'Е',
                        "7" => 'Ё', "8" => 'Ж', "9" => 'З', "10" => 'И', "11" => 'Й', "12" => 'К',
                        "13" => 'Л', "14" => 'М', "15" => 'Н', "16" => 'О', "17" => 'П', "18" => 'Р',
                        "19" => 'С', "20" => 'Т', "21" => 'У', "22" => 'Ф', "23" => 'Х', "24" => 'Ц',
                        "25" => 'Ч', "26" => 'Ш', "27" => 'Щ', "28" => 'Ъ', "29" => 'Ы', "30" => 'Ь',
                        "31" => 'Э', "32" => 'Ю', "33" => 'Я' }

  def start
    @letters = [ 'А', 'М', 'У', 'Л', 'К', 'О', 'А', 'Р', 'П', 'О', 'Е', 'Н', 'Д', 'Е', 'С', 'К', 'И', 'Ь', 'Т', 'С',]
    if params[:curr].present?
      @current_word = params[:curr]
    end
  end

  def add_letter
    if params[:curr].present?
      @current_word = ""
      curr = params[:curr].split("-")
      curr.each do |c|
        @current_word += NUMBERS_TO_LETTERS[c]
      end
    end
    if !@current_word
      @current_word = "" + NUMBERS_TO_LETTERS[params[:number]]
    else
      @current_word += NUMBERS_TO_LETTERS[params[:number]]
    end
    redirect_to action: 'start', curr:@current_word
  end

end