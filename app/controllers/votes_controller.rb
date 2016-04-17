class VotesController < ApplicationController
  before_action :require_user

  def create
    @gif = Gif.find(params[:gif_id])
    if current_user.voted_for?(@gif)
      current_user.unvote_for(@gif)
    else
      current_user.unvote_for(@gif)
      current_user.vote_for(@gif)
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end
  end

  def destroy
    @gif = Gif.find(params[:gif_id])
    if current_user.voted_against?(@gif)
      current_user.unvote_for(@gif)
    else
      current_user.unvote_for(@gif)
      current_user.vote_against(@gif)
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :create }
    end
  end

end
