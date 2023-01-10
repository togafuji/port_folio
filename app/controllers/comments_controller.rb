class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    redirect_back(fallback_location: user_diary_path(current_user,@comment.diary))
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :comment_content, :who_comment, :diary_id, :user_id)
  end
end
