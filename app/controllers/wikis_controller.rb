class WikisController < ApplicationController
  def show
    @wiki = Wiki.find(params[:id])
    categories = @wiki.categories.all.sort_by { |cat| cat.name }

    selectable_categories = categories.select{ |cat| !cat.facts.empty? }
    @selected_category = selectable_categories[rand(selectable_categories.length)]

    @root_categories = categories.select{ |cat| cat.parent.nil? }
  end
end