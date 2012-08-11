class User < ActiveRecord::Base
  attr_accessible :uid, :token, :username, as: :new_user
  def self.create_from_oauth(auth_hash)
    create(
      { uid: auth_hash[:uid],
      token: auth_hash[:credentials][:token],
      username: auth_hash[:info][:name] },
      as: :new_user
    )
  end
end
