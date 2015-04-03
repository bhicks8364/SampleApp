json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :employee_profile_id, :job_order_id, :pay_rate, :bill_rate
  json.url assignment_url(assignment, format: :json)
end
