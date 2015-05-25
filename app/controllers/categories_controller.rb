class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_name(params[:category])
    @root_categories = Category.where(parent: nil).
        sort_by{ |cat| cat.name }
  end
end