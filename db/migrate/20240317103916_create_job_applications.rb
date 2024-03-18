class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.references :job_seeker, foreign_key: { to_table: :users }, null: false
      t.references :job_post, foreign_key: { to_table: :job_posts }, null: false
      t.string :status, default: 'Not Seen', null: false
      t.timestamps
    end
  end
end
