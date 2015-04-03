json.array!(@job_orders) do |job_order|
  json.extract! job_order, :id, :job_title, :company_profile_id, :fill_date
  json.url job_order_url(job_order, format: :json)
end
