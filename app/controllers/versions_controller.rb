class VersionsController < ApplicationController
  before_action :set_resource, only: [:index]
  def index
    @versions = @resource.versions.
        select{ |v| v.event != 'create' }.
        sort_by{ |v| v.created_at }.
        reverse
  end

  def show
    @version = PaperTrail::Version.find(params[:id])
    @resource = @version.reify
    @fact = @resource if @version.item_type == 'Fact'
    @reference = @resource if @version.item_type == 'Reference'
  end

  def restore
    version = PaperTrail::Version.find(params[:id])
    resource = version.reify
    resource.version_description = "Restored v#{resource.id}"
    resource.save
    redirect_to resource
  end

  def diff
    @version1 = PaperTrail::Version.find(params[:id])
    @resource1 = @version1.reify

    if params[:v2] == 'CURRENT'
      @resource2 = @resource1.class.find(@resource1.id)
    else
      @version2 = PaperTrail::Version.find(params[:v2])
      @resource2 = @version2.reify
    end

    @title_diff = Diffy::Diff.new(@resource1.title, @resource2.title).to_s(:html).html_safe if @resource1.respond_to?(:title)
    @summary_diff = Diffy::Diff.new(@resource1.summary, @resource2.summary).to_s(:html).html_safe if @resource1.respond_to?(:summary)
    @content_diff = Diffy::Diff.new(@resource1.content, @resource2.content).to_s(:html).html_safe if @resource1.respond_to?(:content)
  end

private
  def set_resource
    @resource = Fact.find(params[:fact_id]) if params[:fact_id]
    @resource = Reference.find(params[:reference_id]) if params[:reference_id]
  end
end