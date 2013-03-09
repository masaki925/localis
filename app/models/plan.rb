class Plan < ActiveRecord::Base
  attr_accessible :purchased, :request_id, :title, :user_id
  has_many :plan_days
  belongs_to :request
  belongs_to :user
end
