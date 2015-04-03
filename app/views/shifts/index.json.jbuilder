json.array!(@shifts) do |shift|
  json.extract! shift, :id, :assignment_id, :week, :hours_worked, :time_in, :time_out, :state
  json.url shift_url(shift, format: :json)
end
