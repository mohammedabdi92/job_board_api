class JobPost < ApplicationRecord
    belongs_to :created_by, class_name: 'User'
    belongs_to :updated_by, class_name: 'User'
    has_many :job_applications
  
    validates :title, :description, presence: true
end