module VotesHelper

  def has_upvote?(voteable)
    current_user.voted_for?(voteable) ? "vote-arrow green-arrow" : "vote-arrow"
  end

  def has_downvote?(voteable)
    current_user.voted_against?(voteable) ? "vote-arrow red-arrow" : "vote-arrow"
  end
end
