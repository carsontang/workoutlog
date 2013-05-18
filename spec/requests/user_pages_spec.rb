require 'spec_helper'

describe "User pages" do
  subject { page }
  describe "signup page" do
    before { visit new_user_registration_path }

    it { should have_title("| Sign up") }
  end

  describe "signin page" do
    before { visit new_user_session_path }
    it { should have_title("| Sign in")}
  end

  describe "signup page" do
    before { visit new_user_registration_path }
    it { should have_title("| Sign up") }
  end
end
