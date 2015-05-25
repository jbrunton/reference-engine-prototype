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
    @fact.version_description = "Restored v#{@version.id}"
    @fact.save
    redirect_to @fact
  end

  def diff
    @version1 = PaperTrail::Version.find(params[:id])
    @fact1 = @version1.reify

    if params[:v2] == 'CURRENT'
      @fact2 = Fact.find(@fact1.id)
    else
      @version2 = PaperTrail::Version.find(params[:v2])
      @fact2 = @version2.reify
    end

    @summary_diff = Diffy::Diff.new(@fact1.summary, @fact2.summary).to_s(:html).html_safe
    @content_diff = Diffy::Diff.new(@fact1.content, @fact2.content).to_s(:html).html_safe
  end
end