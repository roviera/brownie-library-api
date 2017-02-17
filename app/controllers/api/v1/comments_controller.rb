module Api
  module V1
    class CommentsController < Api::V1::ApiController
      before_action :set_comment, only: [:destroy]

      def index
        @comments = Comment.all
        render json: @acomments.as_json(only: [:id])
      end

      def create
        @comment = Comment.new(comment_params)
        @comment.book = book
        @comment.user = current_user
        if @comment.save
          render json: @comment.as_json(only: [:id]), status: :created, notice: 'Comment created successfully'
        else
          render json: { error: @comment.errors.as_json }, status: :unprocessable_entity
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

      def comment_params
        params.require(:comment).permit(:text)
      end

    end
  end
end
