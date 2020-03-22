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
# 支払い方法のenum 定義(デフォルトは０)
    enum payment: { クレジットカード:0, 銀行振込:1 }
# 注文ステータスのenum 定義(デフォルトは０)
    enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }


# 注文のcreateが今日のものを抜き出すメソッド（管理者側トップページに使用）
    scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
end
