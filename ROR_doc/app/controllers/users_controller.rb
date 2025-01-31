class UsersController < ApplicationController

    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy]
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render json: @users, status: :ok 
    end

    def show
        render json: @users, status: :ok 
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages},
                    status: :unprocessable_entity
        end
    end

    def update
        unless @user.upadte(user_params)
            render json: {errors: @user.errors.full_messages},
                status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end


    private
        def user_params
            params.permit(:username, :email, :password)
        end

        def set_user
            @user = User.find(params[:id])
        end
            
end
