class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  def index
    @users = User.includes(:school).all

  end

  def admin
    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(params, user: current_user, view_context: view_context) }
    end
  end

  def teachers
    respond_to do |format|
      format.html
      format.json { render json: GradeStudentsDatatable.new(params, user: current_user, grade: params[:id], view_context: view_context) }
    end
  end

  def set_grades
    @grades = [
      {:name => "Pre-K", :school_id => current_user.school.id },
      {:name => "Kindergarten", :school_id => current_user.school.id },
      {:name => "1st Grade", :school_id => current_user.school.id },
      {:name => "2nd Grade", :school_id => current_user.school.id },
      {:name => "3rd Grade", :school_id => current_user.school.id },
      {:name => "4th Grade", :school_id => current_user.school.id },
      {:name => "5th Grade", :school_id => current_user.school.id },
      {:name => "6th Grade", :school_id => current_user.school.id },
      {:name => "7th Grade", :school_id => current_user.school.id },
      {:name => "8th Grade", :school_id => current_user.school.id },
      {:name => "9th Grade", :school_id => current_user.school.id },
      {:name => "10th Grade", :school_id => current_user.school.id },
      {:name => "11th Grade", :school_id => current_user.school.id },
      {:name => "12th Grade", :school_id => current_user.school.id }]
    Grade.create(@grades)
    redirect_to (dashboard_path), notice: 'Default grades created!.'
  end
end