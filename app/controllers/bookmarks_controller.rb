class BookmarksController < ApplicationController

  def create
    debugger
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show', @list, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment).permit(:name)
  end
end
