require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Track your workouts and learn how to tweak your workout sessions for optimal growth.') }
    it { should have_title("Swol | Super Workout Log") }
  end
end
