class BrowseController < ApplicationController
  def category
    @category = Category.find_by(name: params[:category])
    @facts = @category.facts
  end
end