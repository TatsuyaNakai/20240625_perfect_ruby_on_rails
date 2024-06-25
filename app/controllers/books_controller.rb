class BooksController < ApplicationController
  def show
    @book = Book.find(:id)

    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @book = Book.find(:id)
    @book.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head: :no_content }
    end
  end
end