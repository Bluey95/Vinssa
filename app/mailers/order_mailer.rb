class OrderMailer < ApplicationMailer
    default from: 'vinssapharmacy@gmail.com'

    def order_sent_email
        @order = params[:order]
        puts(@order)
        @id = @order.id
        @items = LineItem.where(:order_id => @id).to_a
        @items.each do |item|
            @drug_id = item.drug_id
            @drug = Drug.find(@drug_id)
        end
        @supplier_id = @drug.supplier
        @supplier = User.find(@supplier_id)
        @supplier.email
        mail(to: @supplier.email, subject: 'Order Request')
    end
end
