class JobOrdersController < ApplicationController

  before_action :set_job_order, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource 
  # load_and_authorize_resource :job_order
  # load_resource :company_profile
  # load_resource :agency_profile
  # load_and_authorize_resource :job_order, :through => [:company_profile, :agency_profile]
#   # GET /job_orders
  # GET /job_orders.json
  def search
    @q = JobOrder.search(params[:q])
    @job_orders = @q.result.includes(:company_profile, :timesheets)
    @q.build_condition if @q.conditions.empty?
    @q.build_sort if @q.sorts.empty?
  end
  
  def index
    @company_profile = CompanyProfile.find(params[:company_profile_id])

    @job_orders = @company_profile.job_orders.newest_first
  end

  # GET /job_orders/1
  # GET /job_orders/1.json
  def show
    # @company_profile = CompanyProfile.find(params[:company_profile_id])
    @job_order = JobOrder.find(params[:id])
    @company_profile = @job_order.company_profile
    @assignments = @job_order.assignments
    @timesheets = @job_order.timesheets.where(week: Date.today.cweek)
    @company_profile = @job_order.company_profile
    # @user = @assignment.employee_profile.user
  end

  # GET /job_orders/new
  def new
    # @company_profile = CompanyProfile.find(params[:company_profile_id])
    @job_order = JobOrder.new
    # @job_order.assignments.build
    
        respond_to do |format|
          format.html 
          format.json { render json: @job_order }
          format.js
        end
      
  end

  # GET /job_orders/1/edit
  def edit
    # @employees = EmployeeProfile.includes(:current_assignment).where(assignments: { id: nil })
    @account_managers = @job_order.agency_profile.account_managers
    # @job_order.assignments.build
  end

  # POST /job_orders
  # POST /job_orders.json
  def create

    @job_order = JobOrder.create(job_order_params)
    # @job_order.agency_profile = agency
    # @job_order.save
    # @job_order.assignments.build


    respond_to do |format|
      if @job_order.save
        format.html { redirect_to job_orders_path(@job_order, anchor: "job_order_#{@job_order.id}"), notice: 'Job order was successfully created.' }
        format.json { render :show, status: :created, location: @job_order }
        format.js
      else
        format.html { render :new }
        format.json { render json: @job_order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /job_orders/1
  # PATCH/PUT /job_orders/1.json
  def update
    respond_to do |format|
      if @job_order.update_attributes(job_order_params)
        format.html { redirect_to job_orders_path(@job_order, anchor: "job_order_#{@job_order.id}"), notice: 'Job order was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_order }
      else
        format.html { render :edit }
        format.json { render json: @job_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_orders/1
  # DELETE /job_orders/1.json
  def destroy

    @job_order.destroy
    respond_to do |format|
      format.html { redirect_to company_profile_job_orders_url(@company_profile), notice: 'Job order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_order
      @job_order = JobOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def job_order_params
    #   params.require(:job_order).permit(:job_title, :job_description, :company_profile_id, :fill_date, company_profile_attributes: [:id, :company_name], assignment_attributes: [:id, :job_order_id, :employee_profile_id, :pay_rate, :bill_rate, :_destroy], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])
    # end
    
    # def assignment_params
    #   params.require(:assignment).permit(:id, :pay_rate, :bill_rate, job_order_attributes: [:id, :job_title, :job_description, :active, :fill_date], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])
    # end
    def job_order_params
      params.require(:job_order).permit!
    end
end
