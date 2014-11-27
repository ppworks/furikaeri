class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :project_id, null: false
      t.string :title, null: false
      t.string :status, null: false

      t.timestamps
    end
    add_index :issues, [:project_id]
  end
end
