class AddTimestampsAndCreatedByUpdatedByToJobPosts < ActiveRecord::Migration[7.1]
  def up
    change_table :job_posts do |t|
      t.change_default :created_at, -> { 'CURRENT_TIMESTAMP' }
      t.change_default :updated_at, -> { 'CURRENT_TIMESTAMP' }
      t.integer :created_by
      t.integer :updated_by
    end
  end

  def down
    change_table :job_posts do |t|
      t.change_default :created_at, nil
      t.change_default :updated_at, nil
      t.remove :created_by
      t.remove :updated_by
    end
  end
end
