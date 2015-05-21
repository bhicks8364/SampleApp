class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy, :approve]

  # GET /timesheets
  # GET /timesheets.json
  def index
    # @current_timesheets = Timesheet.current
    @current_profile = current_user.profile
    @timesheets = @current_profile.timesheets
    
    # @current_by_state = Timesheet.current.group(:state).count
    @timesheets_by_week = @timesheets.group(:week).order(week: :desc, updated_at: :desc).count
    # @all_by_week = Timesheet.group(:week).order(week: :desc, updated_at: :desc).count
  end

  # GET /timesheets/1
  # Timesheet.group(:status).count
  # GET /timesheets/1.json
  def show
    @assignment = @timesheet.assignment
    @employee = @assignment.employee_profile
    @company = @assignment.company_profile
    @shifts = @timesheet.shifts
    
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @timesheet }
      format.js
    end
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.create(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet }
        format.js
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
  def approve
    sleep 3
    @timesheet.approve!
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_params
      params.require(:timesheet).permit!
    end
end
