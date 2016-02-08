require 'rails_helper'

RSpec.describe Workout, type: :model do

  it { should have_many(:workout_exercises) }

  it { should validate_presence_of(:workout_exercises).with_message("Must have at least one Exercise") }

  it { should validate_presence_of(:date) }

  it { should_not allow_value(1.days.from_now).for(:date) }

  it { should allow_value(Date.today).for(:date) }
end
