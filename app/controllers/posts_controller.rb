class PostsController < ApplicationController
    def index
        if params[:group_id]
            @posts = Post.where(group_id: params[:group_id])
        else
            @posts = Post.joins(group: :users).where(users: { id: params[:user_id] })
        end
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.new(post_params)
        @post.user = User.find(post_params[:user_id])
        @post.group = Group.find(post_params[:group_id])
        if @post.save
            render json: @post, status: :created
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :group_id, :content)
    end
end
