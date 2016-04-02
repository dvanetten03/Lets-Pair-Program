class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new

  end

end
