require 'spec_helper'

describe User do
  before { @user = User.new(:email => "user@example.com", :password => "12345678") }
  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email is not in the right format" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        @user.email = address
        @user.should_not be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is already taken" do
    before do
      user = User.new(:email => "user2@example.com", :password => "12345678")
      user.save
    end

    it { should be_valid }
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end

  describe "when password is less than 8 characters long" do
    before { @user.password = (1..7).to_a.join }
    it { should_not be_valid }
  end
end