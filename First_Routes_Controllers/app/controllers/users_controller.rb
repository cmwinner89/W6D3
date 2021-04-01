class UsersController < ApplicationController
    def index
       
       
        if params[:id]
            diplay = User.all
        else
            display = ""
            all_users = User.all
            all_users.each do |user|
                if user.username.chars.map(&:downcase) == params[:q].chars.map(&:downcase)
                   display = user.username
                end
            end
        end
        render json: display
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.delete
    end

    private
    
    def user_params
        params.require(:user).permit(:username)
    end
end