class Answer < ActiveRecord::Base
  scope :default, -> {where default: true}
  has_one :response
end
