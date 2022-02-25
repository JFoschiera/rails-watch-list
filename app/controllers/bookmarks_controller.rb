class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end


# GET new
# assigns a new bookmark to @list (FAILED - 1)
# POST create
# with valid params
#   creates a new bookmark (FAILED - 2)
#   assigns a newly created bookmark as @bookmark (FAILED - 3)
#   redirects to the created list (FAILED - 4)
# with invalid params
#   assigns a newly created but unsaved bookmark as @bookmark (FAILED - 5)
#   re-renders the 'new' template or 'lists/show' (FAILED - 6)
# DELETE destroy
# deletes a bookmark (FAILED - 7)
