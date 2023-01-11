class CalendarsController < ApplicationController
  before_action :set_calendar, only: [ :show, :edit, :update, :destroy]

  def index
        @calendar = Calendar.all
  end

  def show
  
  end

  def new
    @instudio = Instudio.find(params[:instudio_id])
    @calendar = Calendar.new
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @instudio = Instudio.find(params[:instudio_id])
    @calendar.instudio = @instudio


    if @calendar.save
      redirect_to profile_path, notice: "Your Product Calendar was successfully created."
    else
      render :new
    end
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to dashboard_instudio_path, notice: "Your Studio Session was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @calendar.destroy
    redirect_to root_path, notice: "Your Product Calendar  was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def calendar_params
    params.require(:calendar).permit(:deadline,
                                :period,
                                :step,
                                :manequin, 
                                :delivery,
                                :instudio_id
                                )
  end
end
