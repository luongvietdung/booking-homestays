# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :load_room, only: %i[create destroy]
  before_action :load_comment, only: :destroy

  def create
    @comment = @room.comments.new comment_params
    @comment.user_id = current_member.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js {}
      end
    else
      flash[:danger] = t "controller.reviews.delete_review_fail"
      redirect_to room_path(@room)
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_room
    @room = Room.find params[:room_id]
  end

  def load_comment
    @comment = Comment.find params[:id]
  end
end
