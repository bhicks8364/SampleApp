{"filter":false,"title":"shifts_controller.rb","tooltip":"/app/controllers/api/shifts_controller.rb","undoManager":{"mark":17,"position":17,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":21,"column":3},"action":"insert","lines":["class Api::JobOrdersController < ApplicationController","  skip_before_filter :verify_authenticity_token","  respond_to :json","","  def index","    respond_with JobOrder.all","  end","  ","  def destroy","   respond_with JobOrder.destroy(params[:id])","  end","","    #   params.require(:job_order).permit(:job_title, :job_description, :company_profile_id, :fill_date, company_profile_attributes: [:id, :company_name], assignment_attributes: [:id, :job_order_id, :employee_profile_id, :pay_rate, :bill_rate, :_destroy], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])","    # end","    ","    # def assignment_params","    #   params.require(:assignment).permit(:id, :pay_rate, :bill_rate, job_order_attributes: [:id, :job_title, :job_description, :active, :fill_date], employee_profile_attributes: [:id, :employee_name, :ssn, :w2_box5, :marital_status, :_destroy ])","    # end","    def job_order_params","      params.require(:job_order).permit!","    end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":11},"end":{"row":0,"column":19},"action":"remove","lines":["JobOrder"]},{"start":{"row":0,"column":11},"end":{"row":0,"column":12},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":12},"end":{"row":0,"column":13},"action":"insert","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":13},"end":{"row":0,"column":14},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":14},"end":{"row":0,"column":15},"action":"insert","lines":["f"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":15},"end":{"row":0,"column":16},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":16},"end":{"row":0,"column":17},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":16},"end":{"row":0,"column":17},"action":"remove","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":17},"end":{"row":5,"column":25},"action":"remove","lines":["JobOrder"]},{"start":{"row":5,"column":17},"end":{"row":5,"column":18},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":18},"end":{"row":5,"column":19},"action":"insert","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":19},"end":{"row":5,"column":20},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":20},"end":{"row":5,"column":21},"action":"insert","lines":["f"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":21},"end":{"row":5,"column":22},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":16},"end":{"row":9,"column":24},"action":"remove","lines":["JobOrder"]},{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":17},"end":{"row":9,"column":18},"action":"insert","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":18},"end":{"row":9,"column":19},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":19},"end":{"row":9,"column":20},"action":"insert","lines":["f"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":20},"end":{"row":9,"column":21},"action":"insert","lines":["t"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":13,"column":9},"end":{"row":13,"column":9},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1429118722000,"hash":"00d3cb373404d8255d26cd7925f381f2b9762b0f"}