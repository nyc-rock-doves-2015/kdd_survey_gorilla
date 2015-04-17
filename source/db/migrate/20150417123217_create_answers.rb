class CreateAnswers < ActiveRecord::Migration
  def change
     create_table :answers do |t|
      t.references :user, null: false
      t.references :option, null: false
      t.timestamps
    end
  end
end
