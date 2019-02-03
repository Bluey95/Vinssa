class SupplierMailer < ApplicationMailer
    default from: 'susanwere15@gmail.com'

    def order_received_email
        @order = params[:order]
        mail(to: 'vinssapharmacy@gmail.com', subject: 'Order Received')
    end
end
