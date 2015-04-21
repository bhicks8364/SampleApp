json.array!(@timesheets) do |timesheet|
  json.extract! timesheet, :id, :company_profile_id, :week
  json.url timesheet_url(timesheet, format: :json)
end
