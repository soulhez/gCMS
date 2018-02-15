# Pages controller
class PagesController < ApplicationController
  def contact
    @secret_text = 'To jest sekretny tekst! :)' if params[:id] == '5'
  end

  def help; end

  def homepage; end
end
