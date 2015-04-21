class Api::ShiftsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    respond_with Shift.all
  end
  
  def destroy
   respond_with shift.destroy(params[:id])
  end

    #   params.require(:job_order).permit(:job_title, :job_description, :company_profile_id, :fill_date, company_profile_attributes: [:id, :company_name], assignment_attributes: [:id, :job_order_id, :employee_profile_id, :pay_rate, :bill_rate, :_destroy], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])
    # end
    
    # def assignment_params
    #   params.require(:assignment).permit(:id, :pay_rate, :bill_rate, job_order_attributes: [:id, :job_title, :job_description, :active, :fill_date], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])
    # end
    def job_order_params
      params.require(:job_order).permit!
    end
end