class Pedido <ActiveRecord::Base

	has_many :itens

	def adicionar_produto(produto, quantidade)
		if item = self.itens.detect {|i| i.produto == produto}
			item.incrementar_quantidade(quantidade)
			item.save!
		else
			self.itens.create!(
				:produto => produto,
				:quantidade => quantidade)
		end
	end

end