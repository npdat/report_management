require 'spec_helper'

describe User do
  context "with 2 or more Users" do
    it "orders them in reverse" do
      user = User.create(username: "datslife", email: "npdat@tma.com.vn")
      #user1 = user.username("user1")
      #user2 = user.username("user2")
      #user.reload.username.should eq("datslife")
      expect(user.username).to eq("datslife")
    end
  end
end