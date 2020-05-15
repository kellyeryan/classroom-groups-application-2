class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :subject_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
