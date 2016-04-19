require 'test_helper'

class GifTest < ActiveSupport::TestCase
  def setup
    @gif = Gif.new(url: "http://i.giphy.com/xTiQyABWzvBGCqmzKw.gif", description: "not turtles")
    @user = User.create!(username: "bob_vila", email: "cheese@cheddar.com", bio: "definitely likes turtles", password: "password")
    @gif.user = @user
  end

  test 'gif has url' do
    @gif.url = nil
    refute @gif.valid?
  end

  test 'gif has description' do
    @gif.description = nil
    refute @gif.valid?
  end

  test 'gif belongs to user' do
    @gif.save
    assert @gif.user == @user
  end

  test 'url ends with ".gif"' do
    assert @gif.valid?
    @gif.url = "http://i.giphy.com/xTiQyABWzvBGCqmzKw"
    refute @gif.valid?
  end

  test 'url begins with "http" or "https"' do
    assert @gif.valid?
    @gif.url = "https://i.giphy.com/xTiQyABWzvBGCqmzKw.gif"
    assert @gif.valid?
    @gif.url = "htttp://i.giphy.com/xTiQyABWzvBGCqmzKw.gif"
    refute @gif.valid?
  end

end
