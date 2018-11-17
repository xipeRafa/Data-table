class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:new, :create]
  load_and_authorize_resource
  layout "application"

  # GET /schools
  def index
    @schools = School.where(user_id: current_user.id)
  end

  # GET /schools/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: ClassroomDatatable.new(params, user: current_user, view_context: view_context) }
    end
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  def create
    @school = School.new(school_params)
    @school.user_id = current_user.id if current_user

    if @school.invalid?
      render :new
    elsif @school.save
      if (current_user)
        redirect_to (schools_path), notice: 'School was successfully created.'
      else
        redirect_to (new_user_registration_path), notice: 'School was successfully created.'
      end
    end
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    redirect_to schools_url, notice: 'School was successfully destroyed.'
  end

  def staff
    respond_to do |format|
      format.json { render json: UsersDatatable.new(params, user: params[:id], view_context: view_context) }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    def set_default_grades(school)
      @grades = [
        {:name => "Pre-K", :school_id => school },
        {:name => "Kindergarten", :school_id => school },
        {:name => "1st Grade", :school_id => school },
        {:name => "2nd Grade", :school_id => school },
        {:name => "3rd Grade", :school_id => school },
        {:name => "4th Grade", :school_id => school },
        {:name => "5th Grade", :school_id => school },
        {:name => "6th Grade", :school_id => school },
        {:name => "7th Grade", :school_id => school },
        {:name => "8th Grade", :school_id => school },
        {:name => "9th Grade", :school_id => school },
        {:name => "10th Grade", :school_id => school },
        {:name => "11th Grade", :school_id => school },
        {:name => "12th Grade", :school_id => school }]
      Grade.create(@grades)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :schooldistrict_id)
    end
end
