class Api::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.includes(workout_exercises: :ex_sets).find_by(id: params[:id])
    if @workout

    else
      render status: 404, json: {message: "No such workout found"}
    end
  end

  def create
    @workout = Workout.new
    @workout.assign_attributes(@json['workout'])
    if @workout.save
      render 'api/workouts/show.json'
    end
  end
end
