module CartHelper

	def quantity_check?(product, quantity)
		if product.quantity < quantity
  		redirect_to product, notice: "Sorry, only #{product.quantity} left in stock."
  		return true
 		elsif quantity <= 0
  		redirect_to product, notice: "Sorry, due to the laws of nature, you cannot order a negative amount of something. Try our website in a different dimension."
  		return true
  	else
  		return false
  	end
  end

end
