require 'rails_helper'

RSpec.describe ExSet, type: :model do
  it { should belong_to(:workout_exercise) }
  it { should validate_presence_of(:reps) }
  it { should validate_numericality_of(:reps).only_integer }
  it { should validate_numericality_of(:reps).is_greater_than_or_equal_to(1) }
  it { should validate_presence_of(:order) }
  it { should validate_numericality_of(:order).only_integer }
  it { should validate_numericality_of(:order).is_greater_than_or_equal_to(1) }
  it { should validate_presence_of(:weight) }
  it { should validate_numericality_of(:weight).is_greater_than_or_equal_to(0) }
end
