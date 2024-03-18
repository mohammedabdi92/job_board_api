class JobApplication < ApplicationRecord
    belongs_to :job_post
    belongs_to :job_seeker, class_name: 'User'
end  