class Category < ApplicationRecord
  def self.priority_order
    Category.order("include_finals DESC", "include_semi_finals DESC", "created_at")
  end
end
