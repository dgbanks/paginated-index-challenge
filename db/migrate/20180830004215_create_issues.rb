class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :summary
      t.string :status
      t.integer :reporter_id, null: false
      t.integer :assignee_id, null: false
      t.timestamps
    end
  end
end
