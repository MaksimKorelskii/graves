# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    #   # render 'pages/index' Это отрабатывает по соглашениям
    #   # Если передать в строке запроса параметр http://localhost:3000/?username=Maks
    #   # params[:username].nil? ? @username = 'Guest' : @username = params[:username]
    # @username = name_or_guest
  end

  private

  def name_or_guest
    return current_user.name_or_email if current_user.present?

    'Guest'
  end

  helper_method :name_or_guest
end
