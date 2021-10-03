class User < ApplicationRecord
    self.primary_key = 'id'
    has_many :messages, dependent: :restrict_with_error

    validates :name, presence: true
    validates :email, presence: true
end
