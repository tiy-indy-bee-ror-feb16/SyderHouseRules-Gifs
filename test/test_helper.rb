require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  def self.user_hash(valid: false, inserted_value: nil, key: nil)
    valid_hash =  {
                    username: Faker::Name.last_name + "_" + Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password(8)
                  }
    if valid
      valid_hash
    else
      if key.nil?
        valid_hash[valid_hash.to_a.sample.flatten.first] = inserted_value # sets a random key in the hash to inserted_value
      else
        valid_hash[key] = inserted_value # sets specific key in the hash to inserted_value
      end
    valid_hash
    end
  end

  @@users = {
    valid: [],
    invalid: {
      short_password: [],
      easy_password: [],
      no_password: [],
      dup_username: [],
      no_username: [],
      no_email: [],
      dup_email: []
    }
  }

  50.times do # valid user
    @@users[:valid].push(User.create(self.user_hash(valid: true)))
  end

  3.times do # short password
    @@users[:invalid][:short_password].push(User.create(self.user_hash(key: :password, inserted_value: Faker::Internet.password(rand(1..7)))))
  end

  3.times do # easy password
    @@users[:invalid][:easy_password].push(User.create(self.user_hash(key: :password, inserted_value: "baagaaab")))
  end

  3.times do # no password
    @@users[:invalid][:no_password].push(User.create(self.user_hash(key: :password)))
  end

  3.times do # duplicate username
    @@users[:invalid][:dup_username].push(User.create(self.user_hash(key: :username, inserted_value: "Bob_the_Great")))
  end

  3.times do # no username
    @@users[:invalid][:no_username].push(User.create(self.user_hash(key: :username)))
  end

  3.times do # duplicate email
    @@users[:invalid][:dup_email].push(User.create(self.user_hash(key: :email, inserted_value: "wombat@wombat.com")))
  end

  3.times do # no email
    @@users[:invalid][:no_email].push(User.create(self.user_hash(key: :email)))
  end

  @@valid_user = @@users[:valid].sample

end
