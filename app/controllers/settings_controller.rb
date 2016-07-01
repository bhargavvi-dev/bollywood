class SettingsController < ApplicationController

  def change_locale
	I18n.default_locale = params[:locale].to_sym if I18n.available_locales.include?params[:locale].to_sym
    cookies.permanent[:educator_locale] = I18n.default_locale
    redirect_to request.referer
  end
end
