class Zombie < ActiveRecord::Base
  validates_presence_of :Name
  validates_presence_of :Graveyard
  validates_numericality_of :No_of_arms
end
