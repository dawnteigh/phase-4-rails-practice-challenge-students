class InstructorsController < ApplicationController
  
  def create
  teach = Instructor.create!(teach_params)
  render json: teach, status: :created
  end

  def index
    render json: Instructor.all, status: :ok
  end

  def show
    if find_teach
      render json: find_teach, status: :ok
    else
      not_found_response
    end
  end

  def update
    if find_teach
      find_teach.update!(teach_params)
      render json: find_teach, status: :ok
    else
      not_found_response
    end
  end

  def destroy
    if find_teach
      find_teach.destroy
      head :no_content
    else
      not_found_response
    end
  end

  private

  def find_teach
    Instructor.find_by(id: params[:id])
  end

  def teach_params
    params.permit(:name)
  end

  def not_found_response
    render json: { error: "Instructor not found" }, status: 404
  end

end
