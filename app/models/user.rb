class User < ApplicationRecord
    belongs_to :zoo
    has_many :reviews
    has_secure_password
end
