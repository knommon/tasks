class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :task
  validates :name, presence: true
end
