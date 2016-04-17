require 'test_helper'

class GifsControllerTest < ActionController::TestCase


  # test "should create gif" do
  #   @user = @@valid_user
  #   params = {
  #     url: "http://i.imgur.com/Y7syDEa.jpg",
  #     description: "Just some gif",
  #   }
  #
  #   post :create, params
  #   gif = assigns(:gif)
  #   assert gif.persisted?
  #
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gifs)
  end

end
