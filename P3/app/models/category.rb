class Category < ActiveRecord::Base
    has_many    :polls, dependent: :destroy
    validates   :name,  presence:   true
end
