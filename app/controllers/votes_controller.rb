class VotesController < ApplicationController
  # before_action :require_user

  def upvote
    @gif = Gif.find(params[:id])
    !current_user.voted_for?(@gif) ? current_user.vote_for(@gif) : current_user.unvote_for(@gif)
    render :nothing => true, :status => :ok
  end

  def downvote
    @gif = Gif.find(params[:id])
    !current_user.voted_against?(@gif) ? current_user.vote_against : current_user.unvote_for(@gif)
    render :nothing => true, :status => :ok
  end

  def destroy
    @gif = Gif.find(params[:id])
    current_user.unvote_for(@gif)
    render :nothing => true, :status => :ok
  end

  private

  def vote_params
    params.require(:vote).permit(:id, :url, :description)
  end
end
