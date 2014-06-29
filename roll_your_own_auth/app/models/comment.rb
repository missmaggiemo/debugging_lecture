class Comment < ActiveRecord::Base

  validates :body, :user_id, :link_id, presence: true

  belongs_to :link
  belongs_to :user

end
