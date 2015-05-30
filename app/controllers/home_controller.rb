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
    active_fact_ids = Fact.select('id').distinct.pluck(:id)
    fact_versions = PaperTrail::Version.where("item_type = 'Fact' AND item_id NOT IN (?)", active_fact_ids).group('"item_id"').having('id = MAX(id)')

    active_reference_ids = Reference.select('id').distinct.pluck(:id)
    reference_versions = PaperTrail::Version.where("item_type = 'Reference' AND item_id NOT IN (?)", active_reference_ids).group('"item_id"').having('id = MAX(id)')

    @versions = fact_versions + reference_versions
  end
end