class CreateReportsTos < ActiveRecord::Migration[5.2]
  def change
    create_table :reports_tos do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
