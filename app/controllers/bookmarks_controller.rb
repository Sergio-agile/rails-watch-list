class BookmarksController < ApplicationController

  def create
    debugger
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie])
    @comment = params[:bookmark][:comment]
    @bookmark = Bookmark.new(comment: @comment, movie: @movie, list: @list)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show', @list, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
