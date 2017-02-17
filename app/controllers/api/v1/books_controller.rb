module Api
  module V1
    class BooksController < Api::V1::ApiController
      before_action :set_book, only: [:show]

      def show
      end

      def index
        @books = Book.all
        render json: @books.as_json(only: [:id])
      end

      def create
      	@book = Book.new(book_params)
      	if @book.save
          render json: @book.as_json(only: [:id]), status: :created
        else
          render json: { error: @book.errors.as_json }, status: :unprocessable_entity
        end
      end

      def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          render json: @book.as_json(only: [:id]), status: :ok
        else
          render json: { error: @book.errors.as_json }, status: :bad_request
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy
        head :no_content
      end

      private

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title, :year, :ISBN)
      end
    end
  end
end
