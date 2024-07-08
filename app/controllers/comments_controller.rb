class CommentsController < ApplicationController
    def index
        @comments = Comment.where(post_id: params[:post_id])
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user = User.find(comment_params[:user_id])
        @comment.post = Post.find(params["post_id"].to_i)
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        begin
            post_id = params[:post_id].to_i
            comment_id = params[:id].to_i
            comment = Post.includes(:comments).find(post_id).comments.find(comment_id)
            comment.destroy
            render json: { status: 'Successfully deleted' }, status: :ok
        rescue Exception => e
            render json: { error: "Error occurred: #{e}" }, status: :not_found
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :content)
    end
end
