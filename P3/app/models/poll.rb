class Poll < ActiveRecord::Base
    belongs_to  :category

    validates   :category_id, presence: true
    validates   :explicit,   presence: true
    validates   :question,   presence: true
    validates   :genderdep,   presence: true
    validates   :flag,   presence: true

    enum genderdep: [ :independent, :male, :female ]
    enum flag:      [ :waiting, :normal, :reported, :blocked ]
end
