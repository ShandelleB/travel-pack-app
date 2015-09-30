class Suggestion < ActiveRecord::Base
    validates :city, :presence => true
    validates :state, :presence => true
    validates :packing_list, :presence => true
end
