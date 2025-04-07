class StudentsController < ApplicationController
  require 'net/http'
  require 'json'
  
  def index
    @students = Student.order(check_in_time: :desc)
    @student = Student.new
    @majors = fetch_majors
  end
  
  def create
    @student = Student.check_in(student_params)
    
    if @student.persisted?
      redirect_to index_path, notice: 'Check-in successful!'
    else
      @students = Student.order(check_in_time: :desc)
      @majors = fetch_majors
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :major)
  end
  
  def fetch_majors
    uri = URI('https://ios-interview.joinhandshake-internal.com/majors')
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    
    
      json_response["majors"].map { |major| major["name"] }



  
  end
end
