require 'rails_helper'

describe Api::V1::AuthenticationController do

  describe "#sign_in" do
    context "credentials is correct" do
      let!(:user) { create :user }
      it "returns status 200" do
        post :sign_in, email: user.email, password: user.password
        expect(response.status).to eq 200
      end
    end
    context "credentials is not correct" do
      let!(:user) { create :user }
      it "returns status 403" do
        post :sign_in, email: user.email, password: "wrong password"
        expect(response.status).to eq 403
      end
    end
  end

end
