require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "signup page" do
    before { visit new_user_registration_path }
    let(:submit) { "Sign up" }

    context "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      it "should show an error message" do
        click_button submit
        should have_selector("div.alert.alert-error")
      end
    end

    context "with valid information" do
      before do
        fill_in "user_email", :with => "carson2@test.com"
        fill_in "user_password", :with => "password"
        fill_in "user_password_confirmation", :with => "password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

    it { should have_title("| Sign up") }
  end
end