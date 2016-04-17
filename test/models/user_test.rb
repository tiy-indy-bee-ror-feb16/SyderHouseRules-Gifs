require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_user = @@users[:valid].sample
  end

  test "validates email presence" do
    @user = @@users[:invalid][:no_email].sample
    refute @user.valid?, "#{@user.username}'s e-mail was not validated for presence"
  end

  test "validates email uniqueness" do
    @user = @@users[:invalid][:dup_email].sample
    refute @user.valid?, "#{@user.username}'s e-mail was not validated for uniqueness"
  end

  test "validates username uniqueness" do
    @user = @@users[:invalid][:dup_username].sample
    refute @user.valid?, "#{@user.username}'s username was not validated for uniqueness"
  end

  test "validates user password is at least eight characters long" do
    @user = @@users[:invalid][:short_password].sample
    refute @user.valid? , "#{@user.username}'s password was not validated for length, it is only #{@user.password.length} characters long"
  end

  test "validates user password contains at least four unique characters" do
    @user = @@users[:invalid][:easy_password].sample
    refute @user.valid?, "#{@user.username}'s password was not validated for a minimum of four unique characters"
  end

  test "users with no avatar are assigned a default when saved" do
    @user = @@users[:invalid][:no_avatar].sample
    @user.save
    refute User.find_by(email: @user.email).avatar.nil?, "#{@user.username} was not given a default avatar"
  end

end
