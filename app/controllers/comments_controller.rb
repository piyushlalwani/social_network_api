class CommentsController < ApplicationController
    def index
        @comments = Comment.where(post_id: params[:post_id])
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user = User.find(params[:user_id])
        @comment.post = Post.find(params[:post_id])
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
