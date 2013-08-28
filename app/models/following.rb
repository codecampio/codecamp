class Following < ActiveRecord::Base
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  validates :from_id, presence: true, exclusion: { in: ->(following) { [ following.to_id ] } } 
  validates :to_id, presence: true
end
