class Convenio < ActiveRecord::Base
  attr_accessible :nome
  has_many :consultas
end
