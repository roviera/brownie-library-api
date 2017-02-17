module Api
  module V1
    class AuthorController < Api::V1::AuthorController
      before_action :set_author, only: [:show]

      def show
      end

      def index
        @authors = Author.all
        render json: @authors.as_json(only: [:id])
      end

      def create
        @author = Author.new(author_params)
        if @author.save
          render json: @author.as_json(only: [:id]), status: :created
        else
          render json: { error: @author.errors.as_json }, status: :unprocessable_entity
        end
      end

      def update
        @author = Author.find(params[:id])
        if @author.update(author_params)
          render json: @author.as_json(only: [:id]), status: :ok
        else
          render json: { error: @author.errors.as_json }, status: :bad_request
        end
      end

      def destroy
        @author = Author.find(params[:id])
        @author.destroy
        head :no_content
      end

      private

      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:book).permit(:first_name, :last_name)
      end
    end
  end
end
