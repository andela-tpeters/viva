class Bucketlist < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, allow_nil: false

  def self.paginate(page = 1, limit = 20)
    page = 1 if page.zero?
    limit = 20 if limit.zero?
    offset_number = (page - 1) * limit
    offset(offset_number).limit(limit)
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
