class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy, :add_data_classroom, :archive]
  before_action :authenticate_user!
  layout "application"

  # GET /classrooms
  def index
    @classrooms = Classroom.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json { render json: ClassroomDatatable.new(params, user: current_user, view_context: view_context) }
    end
  end

  # GET /classrooms/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: ClassroomStudentsDatatable.new(params, classroom: params[:id], view_context: view_context) }
    end
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
    @students = Student.all
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)
    if current_user.role == "teacher"
      @classroom.user_id = current_user.id
    end
    @classroom.school_id = current_user.school_id

    puts @classroom
    if @classroom.save
      redirect_to (classrooms_path), notice: 'Classroom was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /classrooms/1
  def update
    if @classroom.update(classroom_params)
      redirect_to @classroom, notice: 'Classroom was successfully updated.'
    else
      render :edit
    end
  end

  def archive
    @classroom.archived = true

    if @classroom.save
        redirect_to classrooms_path, notice: 'Data was successfully added.'
      else
        redirect_to classroom_path(params[:id]), notice: 'Data was not added.'
    end
  end

  # GET /classrooms/1/studentdatum
  def add_data_classroom
    @studentdatum = Studentdatum.new
  end

  # POST /classrooms/1/studentdatum
  def studentdatum
    @student_data = Studentdatum.new(studentdata_params)
    @student_data.student_id = params[:id]

    if @student_data.save
      redirect_to student_path(params[:id]), notice: 'Data was successfully added.'
      else
        render :new
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:subject, :user_id, :grade_id, :term)
    end
end
