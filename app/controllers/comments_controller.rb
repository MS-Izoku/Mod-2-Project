class CommentsController < ApplicationController
       
    def new
        @comment = Comment.new 
    end

    def create
        # @comment = Comment.new(comment_params)
        # @comment.user_id = session[:user_id]
        # @comment.progress_update_id 
        # if @comment.save
        # #redirect_to somewhere
        #     #redirect_to progress_update_path(@comment.progress_update)
        # else 
        #     #redirect_to
        # end

        redirect_to progress_update_path(@comment.progress_update)
    end

    def update
        @comment = Comment.find_by(id:params[:id])
        if @comment.update(comment_params)
            #redirect_to somewhere
        else 
            render "edit"
        end 
    end

    private
    def comment_params
        params.require(:comment).permit(:progress_update_id , :user_id , :content)
    end

end
