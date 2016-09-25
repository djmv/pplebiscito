class Voter < ActiveRecord::Base
  belongs_to :place, required: true
end
