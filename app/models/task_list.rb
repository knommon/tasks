class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  validates :name, presence: true
  validates :user_id, presence: true
end
