require 'rails_helper'

describe Api::V1::SessionsController do

  describe "POTS #create" do
    before(:each) do
      @user = FactoryGirl.create :user
    end

    context "when the credentials are correct" do
      before(:each) do
        credentials = { email: @user.email, password: "qwerty123456" }
        post :create, { session: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 200 }
    end

    context "when the credetials are incorrect" do
      before(:each) do
        credentials = { email: @user.email, password: "invalidpasswor" }
        post :create, { session: credentials }
      end

      it "returns a json with an error" do
        expect(json_response[:errors]).to eql "Invalid email or password"
      end

      it { should respond_with 422 }
    end
  end

end
