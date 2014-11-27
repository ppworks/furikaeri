class PagesController < ApplicationController
  def top
    @project = Project.first
  end
end
