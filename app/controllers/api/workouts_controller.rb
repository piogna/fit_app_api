class Api::WorkoutsController < ApplicationController
  def index
    render status: 200, json: Workout.all, each_serializer: SimpleWorkoutSerializer
  end
end
