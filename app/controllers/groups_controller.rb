class GroupsController < ApplicationController
    def index
        @groups = Group.all
        render json: @groups
    end

    def show
        @group = Group.find(params[:id])
        render json: @group
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            render json: @group, status: :created
        else
            render json: @group.errors, status: :unprocessable_entity
        end
    end

    private

    def group_params
        params.require(:group).permit(:name, :description)
    end
end
