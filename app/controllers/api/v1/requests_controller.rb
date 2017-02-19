module Api
  module V1
    class RequestsController < Api::V1::ApiController
      before_action :set_request, only: [:destroy, :update]
      before_action :requests, only: [:index]

      def index
        render json: @requests.as_json(only: [:id])
      end

      def create
        @request = Request.new
        @request.book = set_book
        @request.user = current_user
        @request.status = 2
        if @request.save
          render json: @request.as_json(only: [:id]), status: :created
        else
          render json: { error: @request.errors.as_json }, status: :unprocessable_entity
        end
      end

      def update
        if @request.update(request_params)
          render json: @request.as_json(only: [:id]), status: :ok
        else
          render json: { error: @request.errors.as_json }, status: :bad_request
        end
      end

      def destroy
        @request.destroy
        head :no_content
      end

      private

      def set_request
        @request = Request.find(params[:id])
      end

      def requests
        @requests = Request.where(user_id: params[:user_id])
      end

      def set_book
        @book = Book.find(params[:book_id])
      end

      def request_params
        params.require(:request).permit(:status)
      end

    end
  end
end
