class Book < ApplicationRecord
  #monetize :price
  has_one_attached :image
  belongs_to :user,  optional: true
  validates :name, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :book_no, presence: true
  validates :image, presence: true 
  has_many :book_issues, dependent: :destroy
 # belongs_to :total_fine
  belongs_to :payment 
   



    def paypal_url(return_url)
      values = {
        :business => "sb-e3ua912102888@business.example.com",
        :cmd => '_book',
        :upload => 1,
        :return => return_url,
        :invoice => id
      }
      book_no.each_line do |b|
        values.merge!({
          #{}"amount_#{index=1}" => b.,
        "book_name" => b.name,
          "book_number" => b.id,
        })
      end
      # @books.each do |b|
      #    b.name
      #    b.price
      # end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end
end
     
     