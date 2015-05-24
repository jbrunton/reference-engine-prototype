class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_wiki
private
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id]) unless params[:wiki_id].nil?
  end
end
