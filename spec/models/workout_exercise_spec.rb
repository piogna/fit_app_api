require 'rails_helper'

RSpec.describe WorkoutExercise, type: :model do
  it { should belong_to(:workout) }
  it { should have_many(:ex_sets) }
  it { should validate_presence_of(:ex_sets).with_message("Must have at least one Set") }
  it { should validate_presence_of(:order) }
  it { should validate_numericality_of(:order).only_integer }
  it { should validate_numericality_of(:order).is_greater_than_or_equal_to(1) }
  it { should validate_presence_of(:exercise_name) }
end
