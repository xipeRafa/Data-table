class SchooldistrictsController < ApplicationController
  before_action :set_schooldistrict, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  layout "application"

  # GET /schooldistricts
  def index
    @schooldistricts = Schooldistrict.all
  end

  # GET /schooldistricts/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: Schooldistrict.find(params[:id]) }
    end
  end

  # GET /schooldistricts/new
  def new
    @schooldistrict = Schooldistrict.new
  end

  # GET /schooldistricts/1/edit
  def edit
  end

  # POST /schooldistricts
  def create
    @schooldistrict = Schooldistrict.new(schooldistrict_params)

    if @schooldistrict.invalid?
      render :new
    elsif @schooldistrict.save
      if (current_user)
        redirect_to (schooldistricts_path), notice: 'School district was successfully created.'
      else
        redirect_to (new_user_registration_path), notice: 'School district was successfully created.'
      end
    end
  end

  # PATCH/PUT /schooldistricts/1
  def update
    if @schooldistrict.update(schooldistrict_params)
      redirect_to @schooldistrict, notice: 'Schooldistrict was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /schooldistricts/1
  def destroy
    @schooldistrict.destroy
    redirect_to schooldistricts_url, notice: 'Schooldistrict was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schooldistrict
      @schooldistrict = Schooldistrict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schooldistrict_params
      params.require(:schooldistrict).permit(:name, :state, :city, :zip)
    end
end
