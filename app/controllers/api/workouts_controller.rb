class Api::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.includes(workout_exercises: :ex_sets).find_by(id: params[:id])
    render status: 404, json: {message: "No such workout found"} unless @workout
  end

  def create
    @workout = Workout.new
    @workout.assign_attributes(@json['workout'])
    if @workout.save
      render 'api/workouts/show.json'
    else
      render status: 400, json: {message: @workout.errors.details}
    end
  end
end
