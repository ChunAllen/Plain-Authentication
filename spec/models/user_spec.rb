require 'rails_helper'

describe User do

  let!(:user) { build :user }

  describe "validations" do
    it "checks presence of email" do
      expect(subject).to validate_presence_of :email
    end

    it "checks presence of password" do
      expect(subject).to validate_presence_of :password
    end

    it "checks uniqueness of email" do
      expect(subject).to validate_uniqueness_of :email
    end

    it "checks minimum length of password" do
      user.password = "12345"
      user.save
      expect(user.persisted?).to eq false
    end

    it "checks maximum length of password" do
      user.password = "12345678901"
      user.save
      expect(user.persisted?).to eq false
    end
  end


end

