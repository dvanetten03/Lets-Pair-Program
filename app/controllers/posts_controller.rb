class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

	def index
	end

  def new
    @section = Section.find_by_id(params[:section_id])

    if @section.nil?
      redirect_to posts_path
    else
      @post = Post.new
    end
  end

end
