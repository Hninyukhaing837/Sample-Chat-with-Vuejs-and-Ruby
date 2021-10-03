class Message < ApplicationRecord
    self.primary_key = 'id'
    belongs_to :user

    validates :content, presence: true
    validates :user_id, presence: true
  
    after_create_commit { MessageBroadcastJob.perform_later self }
end
