class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @shift = @assignment.shifts.new
  end

  def clock_in
    @shift = Shift.find(params[:id])
    if @shift.time_in === nil
       @shift.update(time_in: Time.now, state: "Clocked In")

    end
  end
  
  def clock_out
    @shift = Shift.find(params[:id])
    if @shift.time_in != nil && @shift.time_out == nil
       @shift.update(time_out: Time.now, state: "Clocked Out")
       total = (@shift.time_out - @shift.time_in)
       hours_worked = total / 3600
      @shift.update(hours_worked: hours_worked)
      # hours = @shift.time_out - @shift.time_in
      # @shift.update(hours_worked: hours)
    end
  end
  
  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @assignment = Assignment.find(params[:assignment_id])
    @shift = @assignment.shifts.create(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to [@shift.assignment, @shift], notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift.assignment, notice: 'Shift was successfully updated.' }
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
  def calculate_hours_worked
    total = (@shift.time_out - @shift.time_in)
    hours_worked = total / 3600
    @shift.update(hours_worked: hours_worked)
  end
  
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
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:assignment_id, :week, :hours_worked, :time_in, :time_out, :state)
    end
end
