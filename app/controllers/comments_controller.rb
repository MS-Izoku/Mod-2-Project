class CommentsController < ApplicationController
    
    def create
    @comment = Comment.new(comment_params)
    if @comment.save
        redirect_to Rails.application.routes.recognize_path(request.full_path)
    else 
        render "new"
    end
    
    def new
        @comment = Comment.new 
    end

    def update
        @comment = Comment.find_by(id:params[:id])
        if @comment.update(comment_params)
            #redirect_to somewhere
            redirect_to Rails.application.routes.recognize_path(request.full_path)
        else 
            render "edit"
        end 
    end 

end
