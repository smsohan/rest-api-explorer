class Answer < ActiveRecord::Base
  METHODS = %W{GET POST PATCH DELETE PUT HEAD}
  scope :default, -> {where default: true}
  has_one :response
  validates :method, inclusion: {in: METHODS}, presence: true

end
