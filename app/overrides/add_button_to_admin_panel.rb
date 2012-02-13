# Admin Panel buttons
Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_header_actions']",
                    :name => "print_button_header",
                    :text => "<th>print</th>")

Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_row_actions']",
                    :name => "print_button_link",
                    :text => %q{<td><%= link_to "Print", pdf_invoice_prints_path(:order_id => order.id, :format => :pdf) %></td>})

# In Order#show
Deface::Override.new(:virtual_path => %q{spree/admin/orders/show},
                    :insert_bottom => "[data-hook='admin_order_show_buttons']",
                    :name => "print_button_link",
                    :text => %q{<%= button_link_to "Print invoice", pdf_invoice_prints_path(:order_id => @order.id, :format => :pdf), :icon => 'pdf' %>})
