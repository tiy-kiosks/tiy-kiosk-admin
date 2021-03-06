class Slide < ActiveRecord::Base
  belongs_to :kiosk
  scope :active, -> { where("start_date <= ?", Date.today).where("end_date >= ?", Date.today) }
  scope :ordered, -> { order(order_number: :asc)}
end
