class User < ActiveRecord::Base
  has_many :report
  has_many :private_messages

  def self.search(user_id)
      where("user_id = '%i'", user_id)
  end

end
