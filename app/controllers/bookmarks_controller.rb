class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show', @list, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to list_path(@bookmark.list)
    else
      render 'lists/show', @bookmark.list, status: :see_other
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
