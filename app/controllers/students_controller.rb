class StudentsController < ApplicationController
  before_action :set_student,  only: [:show, :edit, :update, :toggle, :destroy, :add_data_student, :studentdatum]
  before_action :authenticate_user!
  before_action :set_studentdatum, only: [:add_data_student]
  layout "application"

  # GET /students
  def index
    @students = Student.where(school: current_user.school_id)
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(params, school: current_user.school_id, view_context: view_context, query: params[:query]) }
    end
  end

  # GET /students/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: StudentdataDatatable.new(params, student: params[:id], view_context: view_context) }
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to (students_path), notice: 'Student was successfully created.'
    else
      render :new
    end
  end



  def toggle
    @student.isactive = !@student.isactive
    if @student.save
      redirect_back(fallback_location: :root, notice: 'Status updated!')
    else
      redirect_back(fallback_location: :root, alert: 'Could not update status!')
    end
  end

  def drop
    @student.classroom_id = null
    if @student.save
      redirect_back(fallback_location: :root, notice: 'Student updated!')
    else
      redirect_back(fallback_location: :root, alert: 'Could not drop student!')
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy

    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end


    # GET /students/1/studentdatum
    def add_data_student
    end
  
    # POST /students/1/studentdatum
    def studentdatum
      @studentdatum = Studentdatum.new(studentdata_params)
      @studentdatum.user_id = current_user.id
      if @studentdatum.save
        redirect_to student_path(params[:id]), notice: 'Data was successfully added.'
      else
        render :add_data_student
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def set_studentdatum
      @studentdatum = Studentdatum.new(student_id: params[:id], classroom_id: @student.classroom.id, user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :middlename, :isactive, :classroom_id)
    end

    def studentdata_params
      params.require(:studentdatum).permit(:title, :text, :student_id, :classroom_id)
    end
end
