class User < ApplicationRecord
    has_many :events, as: :eventable
end
