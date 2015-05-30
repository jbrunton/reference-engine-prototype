class HomeController < ApplicationController
  def index
    categories = Category.all.sort_by { |cat| cat.name }

    selectable_categories = categories.select{ |cat| !cat.facts.empty? }
    @selected_category = selectable_categories[rand(selectable_categories.length)]

    @root_categories = categories.select{ |cat| cat.parent.nil? }
  end

  def about
  end

  def trash
    active_item_ids = Fact.select('id').distinct.pluck(:id) + Reference.select('id').distinct.pluck(:id)
    @versions = PaperTrail::Version.where("item_id NOT IN (?)", active_item_ids).group('"item_id", "item_type"').having('id = MAX(id)')
  end
end