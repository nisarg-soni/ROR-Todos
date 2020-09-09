class Todo < ApplicationRecord
    default_value_for :due do 
        Date.today
    end

    validates :content, presence: true
    validates :due, presence: true
end
