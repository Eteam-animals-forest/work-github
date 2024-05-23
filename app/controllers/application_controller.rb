class ApplicationController < ActionController::Base
  before_action :set_genres
  
  private
  
  def set_genres
    @genres = Genre.all
  end

end
