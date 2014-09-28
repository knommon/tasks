class Task < ActiveRecord::Base
  belongs_to :task_list
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

end
