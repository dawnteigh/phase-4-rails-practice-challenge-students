class StudentsController < ApplicationController

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
    end
  
  def index
    render json: Student.all, status: :ok
  end

  def show
    if find_student
      render json: find_student, status: :ok
    else
      not_found_response
    end
  end

  def update
    if find_student
      find_student.update!(student_params)
      render json: find_student, status: :ok
    else
      not_found_response
    end
  end

  def destroy
    if find_student
      find_student.destroy
      head :no_content
    else
      not_found_response
    end
  end

  private

  def find_student
    Student.find_by(id: params[:id])
  end

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end

  def not_found_response
    render json: { error: "Student not found" }, status: 404
  end
end
