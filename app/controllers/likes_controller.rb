class LikesController < ApplicationController
    def create
        @like = Like.new
        @like.user = User.find(params[:user_id])
        @like.post = Post.find(params[:post_id])
        if @like.save
          render json: @like, status: :created
        else
          render json: @like.errors, status: :unprocessable_entity
        end
    end
end
