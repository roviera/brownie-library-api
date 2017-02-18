module Api
  module V1
    class CommentsController < Api::V1::ApiController
      before_action :set_comment, only: [:destroy, :update]

      def index
        @comments = Comment.all
        render json: @comments.as_json(only: [:id])
      end

      def create
        @comment = Comment.new(comment_params)
        @comment.book = set_book
        @comment.author = set_author
        if @comment.save
          render json: @comment.as_json(only: [:id]), status: :created
        else
          render json: { error: @comment.errors.as_json }, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(comment_params)
          render json: @comment.as_json(only: [:id]), status: :ok
        else
          render json: { error: @comment.errors.as_json }, status: :bad_request
        end
      end

      def destroy
        @comment.destroy
        head :no_content
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def set_book
        @book = Book.find(params[:book_id])
      end

      def set_author
        @author = Author.find(params[:author_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end

    end
  end
end
