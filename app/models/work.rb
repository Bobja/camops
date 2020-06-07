class Work < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true
  validates :company, presence: true
  validates :address, presence: true
  validates :unitPrice, presence: true
  
  belongs_to :user
  
  enum status: { notyet: 0, requesting: 1, submitted:2, completed:3 }
end
