class PagesController < ApplicationController
  def index
    # render 'pages/index' Это отрабатывает по соглашениям
    # Если передать в строке запроса параметр http://localhost:3000/?username=Maks
    params[:username].nil? ? @username = 'Guest' : @username = params[:username]
  end
end
