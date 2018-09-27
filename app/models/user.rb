class User < ApplicationRecord
  has_many :issues_assigned,
            primary_key: :id,
            foreign_key: :assignee_id,
            class_name: :Issue
            
  has_many :issues_reported,
            primary_key: :id,
            foreign_key: :reporter_id,
            class_name: :Issue
end
