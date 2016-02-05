class Workout < ActiveRecord::Base
  has_many :workout_exercises, dependent: :destroy

  validates :date, presence: true

  validate :created_in_past_or_present

  private
  def created_in_past_or_present
    errors.add(:date, "Date must not be in the future") unless date < DateTime.now
  end
end
