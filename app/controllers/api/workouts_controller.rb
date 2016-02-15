class Api::WorkoutsController < ApplicationController
  def index
    render status: 200, json: Workout.all, each_serializer: SimpleWorkoutSerializer
  end

  def show
    workout = Workout.find_by(id: params[:id])
    if workout
      render status: 200, json: workout
    else
      render status: 404, json: {message: "No such workout found"}
    end
  end

  def create
    @workout = Workout.new
    puts params
    @workout.assign_attributes(@json['workout'])
    if @workout.save
      render status: 200, json: @workout
    end
  end
end
