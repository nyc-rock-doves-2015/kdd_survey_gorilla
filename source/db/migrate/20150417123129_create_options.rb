class CreateOptions < ActiveRecord::Migration
  def change
     create_table :options do |t|
      t.references :question, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
