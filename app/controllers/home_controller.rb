class HomeController < ApplicationController
  def index
    @categories = Category.all.sort_by { |cat| cat.name }
  end
end