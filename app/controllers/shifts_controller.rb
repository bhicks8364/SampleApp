class ShiftsController < ApplicationController
  # load_and_authorize_resource :assignment
  # load_and_authorize_resource :shift, :through => :assignment
  before_action :set_shift, only: [:show, :edit, :update, :destroy, :clock_in, :clock_out]

  

  # GET /shifts
  # GET /shifts.json
  def index
    @assignment = Assignment.find(params[:assignment_id])
    @shifts = @assignment.shifts
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
    @assignment = Assignment.find(params[:assignment_id])
    @employee = @assignment.employee
  end

  # GET /shifts/new
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @shift = @assignment.shifts.new

    
    # @timesheet = Timesheet.find(params[:timesheet_id])
    # @shift = @timesheet.shifts.create(week: DateTime.now.cweek)
  end

  
  # GET /shifts/1/edit
  def edit
  end
  # def clock_in?
  #   params[:commit] == "Clock in"
  # end
  
  def clock_out
    sleep 2
    @shift.record_clock_out!
    

  end

  # POST /shifts
  # POST /shifts.json
  def create
    @assignment = Assignment.find(params[:assignment_id])
    @shift = @assignment.shifts.new
    @shift.record_clock_in!


    respond_to do |format|
      if @shift.save


        
        format.html { redirect_to assignment_shift_path(@assignment, @shift), notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
        format.js
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # def set_new_timesheet
  #   @shift.timesheet = Timesheet.find_or_create_by(assignment_id: self.assignment_id, week: Date.today.cweek)
  # end
  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    
    respond_to do |format|
      if @shift.update(shift_params)

         
        
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to @shift.assignment, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  

  

  
  
  # def time_diff(start_time, end_time)
  #   seconds_diff = (start_time - end_time).to_i.abs

  #   hours = seconds_diff / 3600
  #   hours.to_i
  #   # seconds_diff -= hours * 3600

  #   # minutes = seconds_diff / 60
  #   # seconds_diff -= minutes * 60

  #   # seconds = seconds_diff

  #   # "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  # end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @assignment = Assignment.find(params[:assignment_id])
      @shift = @assignment.shifts.find(params[:id])
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    # def shift_params
    #   params.require(:shift).permit(:timesheet_id, :assignment_id, :week, :hours_worked, :time_in, :time_out, :state)
    # end
    
    def shift_params
      params.require(:shift).permit!
    end
    
    
end
