class AddUpdatedByRefToJobPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :job_posts, :updated_by, foreign_key: { to_table: :users }
  end
end
