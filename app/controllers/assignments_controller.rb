class AssignmentsController < ApplicationController
  # load_and_authorize_resource :assignment
  # load_and_authorize_resource :employee_profile
  # load_resource :job_order
  # load_and_authorize_resource :assignment, :through => :employee_profile
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.active.order("created_at DESC")
    @inactive_assignments = Assignment.inactive.order("created_at DESC")
  end
# Assignment.joins(:timesheets).merge(Timesheet.current)

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @company = @assignment.company_profile
    @job_order = @assignment.job_order
    @employee = @assignment.employee_profile
    @timesheets = @assignment.timesheets
    @shifts = @employee.shifts.clocked_in
    
    
    
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
    @company_profiles = CompanyProfile.order('company_profiles.company_name')
    @employee_profiles = EmployeeProfile.unassigned.order('employee_profiles.employee_name').distinct
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
      format.js
    end
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create


    @assignment = Assignment.create(assignment_params)

    respond_to do |format|
      if @assignment.save
        

        format.html { redirect_to assignments_path(@assignment, anchor: "assignment_#{@assignment.id}"), notice: 'Assignment was successfully created.'} 
        format.json { render :show, status: :created, location: @assignment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def cancel
    @assignment = Assignment.find(params[:id])
    @assignment.cancel
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit!
    end
    # def assignment_params
    #   params.require(:assignment).permit(:pay_rate, :bill_rate, job_order_attributes: [:id, :job_title, :job_description, :active, :fill_date], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])
    # end
    
end
