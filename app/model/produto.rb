class Produto < ActiveRecord::Base

  validates_presence_of :nome, :descricao, :preco, :categoria_id
  validates_numericality_of :preco, :greater_than => 0, :allow_blank => true
 
  attr_accessible :nome, :descricao, :preco, :categoria_id
  belongs_to :categoria

end