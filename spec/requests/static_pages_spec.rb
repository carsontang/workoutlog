require 'spec_helper'

describe "Home page" do
  it "should have the right intro" do
    visit '/'
    page.should have_content('Track your workouts and learn how to tweak your workout sessions for optimal growth.')
  end
end
