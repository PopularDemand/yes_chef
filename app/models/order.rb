class Order < ApplicationRecord
  belongs_to :menu
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id

  has_many :menu_item_orders, inverse_of: :order
  has_many :menu_items, through: :menu_item_orders

  accepts_nested_attributes_for :menu_item_orders

  default_scope { include(:menu, :customer, :menu_items, :menu_item_orders) }

  def chef
    menu.chef
  end
end
