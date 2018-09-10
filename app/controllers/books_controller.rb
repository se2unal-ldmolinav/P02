class BooksController < ApplicationController
    def index
        author = Author.find(params[:author_id])
        if author
            books = author.books
            #format.json{render json: books, status:200}
            render json: books, status:200
        end    
    end 
    
    def show
        books = Book.find(params[:id])    
        respond_to do |format|
            format.json{render json: books, status:200}
        end  
    end    
    
    def create
        book = Book.new(params_book)
        if book.save
            respond_to do |format|
                format.json{render json: books, status:200}
            end  
        else
            respond_to do |format|
                format.json{render json: books.errors, status: :unprocessable_entity}
            end
        end    
            
    end 
    
    def params_book
        params.permit(:name, :year, :code, :available)
    end   
    
    def destroy 
        book = Book.find(params[:id])
        book.destroy
        respond_to do |format|
                format.json {render json: book, status: 200}
        end
    end 
    
    def update
        book = Book.find(params[:id])
        if book.update(params_book)
            render json: book, status: 200
        else
            render json: book.errors, status: 422
        end
        
    end

end
