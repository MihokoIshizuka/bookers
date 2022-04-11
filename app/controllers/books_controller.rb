class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
    render :new
    end
  end

  def index
    @books = Book.all
  end


private
  def book_params
  params.permit(:title, :body)
  end
end