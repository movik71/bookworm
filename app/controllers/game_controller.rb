class GameController < ApplicationController

  NUMBERS_TO_LETTERS = {"1" => 'А', "2" => 'Б', "3" => 'В', "4" => 'Г', "5" => 'Д', "6" => 'Е',
                        "7" => 'Ё', "8" => 'Ж', "9" => 'З', "10" => 'И', "11" => 'Й', "12" => 'К',
                        "13" => 'Л', "14" => 'М', "15" => 'Н', "16" => 'О', "17" => 'П', "18" => 'Р',
                        "19" => 'С', "20" => 'Т', "21" => 'У', "22" => 'Ф', "23" => 'Х', "24" => 'Ц',
                        "25" => 'Ч', "26" => 'Ш', "27" => 'Щ', "28" => 'Ъ', "29" => 'Ы', "30" => 'Ь',
                        "31" => 'Э', "32" => 'Ю', "33" => 'Я' }

  LETTERS_TO_NUMBERS = { 'А' => "1", 'Б' => "2", 'В' => "3", 'Г' => "4", 'Д' => "5", 'Е' => "6",
                         'Ё' => "7", 'Ж' => "8", 'З' => "9", 'И' => "10", 'Й' => "11", 'К' => "12",
                         'Л' => "13", 'М' => "14", 'Н' => "15", 'О' => "16", 'П' => "17", 'Р' => "18",
                         'С' => "19", 'Т' => "20", 'У' => "21", 'Ф' => "22", 'Х' => "23", 'Ц' => "24",
                         'Ч' => "25", 'Ш' => "26", 'Щ' => "27", 'Ъ' => "28", 'Ы' => "29", 'Ь' => "30",
                         'Э' => "31", 'Ю' => "32", 'Я' => "33" }

  def start
    @letters = ["Аi1", "Мi2", "Уi3", "Лi4", "Кi5", "Оi6", "Аi7", "Рi8", "Пi9", "Оi10", "Еi11", "Нi12",
                "Дi13", "Еi14", "Сi15", "Кi16", "Иi17", "Ьi18", "Тi19", "Сi20" ]
    if params[:curr].present?
      @current_word = params[:curr]
    end
    if params[:taken].present?
      @taken = params[:taken]
    else
      @taken = ""
    end
    @numbers_to_letters = NUMBERS_TO_LETTERS
    @letters_to_numbers = LETTERS_TO_NUMBERS
  end

  def add_letter
    l = params[:letter].split("i")
    if params[:taken].present?
      @taken = params[:taken] +  l[1] + "-"
    else
      @taken = "" + l[1] + "-"
    end
    if params[:curr].present?
      @current_word = params[:curr]
    end
    if !@current_word
      @current_word = l[0] + "i" + l[1] + "-"
    else
      @current_word += l[0] + "i" + l[1] + "-"
    end
    redirect_to action: 'start', curr:@current_word, taken:@taken
  end

  def delete_letter
    letter = params[:letter]
    @current_word = params[:curr]
    @taken = params[:taken]
    pos_curr = @current_word.index(letter)
    if pos_curr == 0
      redirect_to action: 'start'
    else
      pos_taken = @taken.index(letter.split("i")[1])
      @current_word = @current_word.slice(0..pos_curr - 1)
      @taken = @taken.slice(0..pos_taken - 1)
      redirect_to action: 'start', curr:@current_word, taken:@taken
    end
  end


end