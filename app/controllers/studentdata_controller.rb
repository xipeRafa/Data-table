class StudentdataController < ApplicationController
  before_action :set_studentdatum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "application"

  # GET /studentdata
  def index
    @studentdata = Studentdatum.all
  end

  # GET /studentdata/1
  def show
    
  end

  # GET /studentdata/new
  def new
    @studentdatum = Studentdatum.new

    respond_to do |format|
      format.html
      format.json { render json: @studentdatum }
    end
  end

  # GET /studentdata/new/:student_id
  def add_data
    @studentdatum = Studentdatum.new

    respond_to do |format|
      format.html
      format.json { render json: @studentdatum }
    end
  end

  # GET /studentdata/1/edit
  def edit
  end

  # POST /studentdata
  def create
    @studentdatum = Studentdatum.new(studentdatum_params)
    @studentdatum.user_id = current_user.id

    if @studentdatum.save
      redirect_to @studentdatum, notice: 'Studentdatum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /studentdata/1
  def update
    if @studentdatum.update(studentdatum_params)
      redirect_to @studentdatum, notice: 'Studentdatum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /studentdata/1
  def destroy
    @studentdatum.destroy

    redirect_to studentdata_url, notice: 'Studentdatum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studentdatum
      @studentdatum = Studentdatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studentdatum_params
      params.require(:studentdatum).permit(:title, :text, :student_id, :user_id, :classroom_id)
    end
end
