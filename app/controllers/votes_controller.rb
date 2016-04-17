class VotesController < ApplicationController
  before_action :require_user

  def create
    @gif = (params(:gif))
    @type = (params(:vote_type))
    if @type == "upvote" && !current_user.voted_for?(@gif)
      current_user.vote_for(@gif)
    elsif @type == "downvote" && !current_user.voted_against?(@gif)
      current_user.vote_against(@gif)
    end
    render :nothing => true, :status => :ok
  end

  def destroy
    @gif = (params(:gif))
    current_user.unvote_for(@gif)
    render :nothing => true, :status => :ok
  end

  private

  def vote_params
    params.require(:vote).permit(:gif, :vote_type)
  end
end
