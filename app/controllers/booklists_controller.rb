class BooklistsController < ApplicationController
  def new
    @books = Book.all
    @book = Book.new
end

def index
    @books = Book.all
    @book = Book.new
end

def create
    book = Book.new(book_params)
    if book.save
       redirect_to booklist_path(book.id), notice:"Book was successfully created."
    else
       #render plain:list.errors.inspect
       @books = Book.all
       @book = book
       render "new"
       
       
 end

    
end

def show
    @book = Book.find(params[:id])
end

def edit
    @book = Book.find(params[:id])
end

def update
    book = Book.find(params[:id])
    if book.update(book_params)
       redirect_to booklist_path(book.id), notice:"Book was successfully created."
    else
        @books = Book.all
        @book = book
        render "new"
    end

end


def destory
    book = Book.find(params[:id])
    book.destroy
    redirect_to booklists_path
end



private

def book_params
  params.require(:book).permit(:title, :body)
end
end

