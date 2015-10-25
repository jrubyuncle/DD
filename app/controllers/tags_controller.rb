class TagsController < ApplicationController
  before_action :find_tag, only: [:edit, :update, :destroy]

  def new
  	@tag = Tag.new
  end

  def edit
  end

  def create
  	@tag = @post.tags.build(tag_params)
    #@post.tags << Tag.new(tag_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to post_path(@post), notice: 'Tag was successfully updated.'
		else
      render :edit
    end  	
  end

  def destroy
    if @tag.destroy
      redirect_to post_path(@post), notice: 'Tag was successfully destroyed.'     
    end  	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end  
end
