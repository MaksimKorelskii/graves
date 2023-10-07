# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend
  include ErrorHandling
  include Internationalization

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end
end
