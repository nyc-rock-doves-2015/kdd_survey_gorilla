class CreateSurveySurveytakers < ActiveRecord::Migration
  def change
     create_table :survey_surveytakers do |t|
      t.references :surveytaker, null: false
      t.references :survey, null: false
      t.timestamps
    end
  end
end
