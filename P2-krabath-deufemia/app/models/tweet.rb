class Tweet < ActiveRecord::Base
  belongs_to :zombie
  validates_presence_of :status
  validates_presence_of :zombie
end
