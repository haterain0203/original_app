class CommentsController < ApplicationController
    before_action :correct_user,   only: :destroy

    def new
        @post = Post.find(params[:id])
        @comment = Comment.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @comment.destroy
        flash[:success] = "コメントを削除しました"
        redirect_to request.referrer || root_url
    end
    
    private
    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end

    def correct_user
        @comment = current_user.comments.find_by(id: params[:id])
        redirect_to root_url if @comment.nil?
    end
end
