class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  def set_locale
    if params[:locale] && (I18n.available_locales.include? params[:locale].to_sym)
        session[:locale] = params[:locale].to_sym
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

end
