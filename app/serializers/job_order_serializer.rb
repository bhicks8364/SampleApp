class JobOrderSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :job_description, :active, :fill_date
end