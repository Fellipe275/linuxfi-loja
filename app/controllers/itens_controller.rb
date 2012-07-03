class ItensController < ApplicationController

	def create
		if self.pedido_atual.new_record?
				self.pedido_atual.save!
					session[:pedido_atual_id] = self.pedido_atual.id

		end
		@produto = Produto.find( params[:produto_id])
		@quantidade = params[:quantidade]
		self.pedido_atual.adicionar_produto(@produto, @quantidade)

		respond_to  do |format|
			format.html do
				flash[:success] = %Q!Q produto #{@produto.nome} foi adicionado com sucesso no seu carrinho!
				redirect_to produtos_path
			end
		end


	end
end
