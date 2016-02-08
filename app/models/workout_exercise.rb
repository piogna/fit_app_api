class WorkoutExercise < ActiveRecord::Base
  has_many :ex_sets, dependent: :destroy
  belongs_to :workout

  validates :order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :exercise_name, presence: true

  validate :must_have_sets

  private

  def must_have_sets
    errors.add(:ex_sets, 'Must have at least one Set') if ex_sets.all?(&:marked_for_destruction?)
  end
end
