class CreateChangeRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :change_requests do |t|
      t.string :title
      t.date :deadline
      t.integer :type
      t.string :status, default: 'new'
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
