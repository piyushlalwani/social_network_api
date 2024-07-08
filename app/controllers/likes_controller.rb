class LikesController < ApplicationController
    def create
        @like = Like.new
        @like.user = User.find(like_params[:user_id])
        @like.post = Post.find(like_params[:post_id])
        if @like.save
          render json: @like, status: :created
        else
          render json: @like.errors, status: :unprocessable_entity
        end
    end

    def destroy
        begin
            post_id = params[:post_id].to_i
            like_id = params[:id].to_i
            like = Post.includes(:likes).find(post_id).likes.find(like_id)
            like.destroy
            render json: { status: 'Successfully deleted' }, status: :ok
        rescue Exception => e
            render json: { error: "Error occurred: #{e}" }, status: :not_found
        end
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
