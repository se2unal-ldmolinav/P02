class BooksController < ApplicationController
    def index
        books = Book.all
        respond_to do |format|
            format.html{render html:"Hola Mundo", status:200}
            format.json{render json: books, status:200}
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

end
