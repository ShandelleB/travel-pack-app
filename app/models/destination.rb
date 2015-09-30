class Destination < ActiveRecord::Base
  validates :city, :presence => true
  validates :state, :presence => true
  validates :packing_list, :presence => true
  validates :category, :presence => true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  extend FriendlyId
  friendly_id  :slug_candidates, use: :slugged
      
      def slug_candidates
      [
       :state, :city
      ]
      end
#Method that gets the packing_list and turns it into an array. 
#Items are split by , no need to put quotes.
  def packing_list_a
    self.packing_list.gsub(/(\[\"|\"\])/, '').split(',' )
  end
  
  searchkick
end
