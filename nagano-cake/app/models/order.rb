class Order < ApplicationRecord

	belongs_to :user

	has_many :order_items
    has_many :deliveries

	validates :user_id ,presence: true
    validates :payment ,presence: true
    validates :postal_code ,presence: true
    validates :address ,presence: true
    validates :addressee ,presence: true
    validates :delivery_charge ,presence: true
    validates :charge ,presence: true
    validates :status ,presence: true

    def total_address
        "#{postal_code} #{address} #{addressee}"
    end

    scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
end
