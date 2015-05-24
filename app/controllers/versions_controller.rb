class VersionsController < ApplicationController
  def index
    @fact = Fact.find(params[:fact_id])
    @versions = @fact.versions.
        select{ |v| v.event != 'create' }.
        sort_by{ |v| v.created_at }.
        reverse
  end

  def show
    @version = PaperTrail::Version.find(params[:id])
    @fact = @version.reify
  end

  def restore
    @version = PaperTrail::Version.find(params[:id])
    @fact = @version.reify
    @fact.save
    redirect_to @fact
  end

  def diff
    @version = PaperTrail::Version.find(params[:id])
    @fact_one = @version.reify
    @fact_two = Fact.find(params[:fact_id])
    @summary_diff = Diffy::Diff.new(@fact_one.summary, @fact_two.summary).to_s(:html).html_safe
    @content_diff = Diffy::Diff.new(@fact_one.content, @fact_two.content).to_s(:html).html_safe
  end
end