class CommentsController < ApplicationController

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.delete
    end

    def index
        # debugger
        if params[:artwork_id]
            artwork = Artwork.find(params[:artwork_id])
            comments = artwork.comments
        else
            user = User.find(params[:user_id])
            comments = user.comments
        end
        render json: comments
    end

    private 

    def comment_params
        params.require(:comments).permit(:body, :artwork_id, :author_id) 
    end
end