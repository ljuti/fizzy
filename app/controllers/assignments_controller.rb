class AssignmentsController < ApplicationController
  before_action :set_bubble, only: %i[ create update ]
  before_action :set_assignment, only: :update

  def create
    @assignment = @bubble.assignments.build(assignment_params)
    @assignment.save

    redirect_to @bubble
  end

  def update
    @assignment.update(assignment_params)
    redirect_to @bubble
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id)
  end

  def set_assignment
    @assignment = @bubble.assignments.find(params[:id])
  end

  def set_bubble
    @bubble = Bubble.find(params[:bubble_id])
  end
end
