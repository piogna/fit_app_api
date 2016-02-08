class Api::WorkoutsController < ApplicationController
  def index
    render status: 200, json: {
      workouts: Workout.all
    }
  end
end
