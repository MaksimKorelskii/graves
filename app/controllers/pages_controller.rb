class PagesController < ApplicationController
  def index
    # render 'pages/index' Это отрабатывает по соглашениям
    # Если передать в строке запроса параметр http://localhost:3000/?username=Maks
    # params[:username].nil? ? @username = 'Guest' : @username = params[:username]
    if current_user
      @username = current_user&.email.split('@')[0].capitalize
    else
      @username = 'Guest'
    end
  end
end
