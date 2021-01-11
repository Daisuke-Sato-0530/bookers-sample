class HomesController < ApplicationController
  def top
  end

  def show
    @book = Blog.find(params[:id])
  end

  def index
    @book = Blog.all
  end

  def new
    @book = Blog.new
  end

  def create
    book = Blog.new(book_params)
    book.save
    redirect_to show_room_path(book.id)
  end

  def edit
    @book = Blog.find(params[:id])
  end

  def update
    book = Blog.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end

  def destroy
    book = Blog.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:blog).permit(:title,:body)
    end
end
