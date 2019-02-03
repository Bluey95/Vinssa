class OrderPdf < Prawn::Document
    def initialize(order)
        super(top_margin: 80)
        @order = order
        order_pdf_title
        line_items
        thank_you_note
    end

    def order_pdf_title
        text "Invoice for Order #{@order.id}", size: 30, style: :bold, align: :center
    end

    def line_items
        move_down 30
        table line_item_rows do
            row(0).font_style = :bold
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.header = true
            self.position = :center
        end
    end

    def line_item_rows
        [["Drug Name", "Drug Quantity", "Drug Price (Ksh)", "Total Amount (Ksh)", "Supplier"]] +
        @order.line_items.map do |item|
            [Drug.find(item.drug_id).name, item.quantity, Drug.find(item.drug_id).price, item.quantity*Drug.find(item.drug_id).price, User.find(Drug.find(item.drug_id).supplier).username]
        end
    end

    def thank_you_note
        move_down 20
        text "This order request was made successfuly. The supplier will reach out to you.", size: 10, style: :italic, align: :center
    end
end