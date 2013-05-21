require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    it { should have_title("| Sign in") }
    it { should have_selector('h3', :text => "Please sign in") }
    it { should have_selector('input#user_email') }
    it { should have_selector('input#user_password') }
    it { should have_selector('label', :text => "Remember me") }
    it { should have_selector('input') }

    context "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('p.alert.alert-error', :text => "Invalid email or password.") }
    end
  end
end