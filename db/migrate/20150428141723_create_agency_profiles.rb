class CreateAgencyProfiles < ActiveRecord::Migration
  def change
    create_table :agency_profiles do |t|
      t.string :agency_name

      t.timestamps
    end
  end
end
