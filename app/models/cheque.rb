class Cheque < ActiveRecord::Base
  attr_accessible :amount, :drawer, :payee

  validates :amount, :drawer, :payee, :presence => true
end
