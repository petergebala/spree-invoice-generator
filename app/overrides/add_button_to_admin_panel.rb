# Admin Panel buttons
Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_header_actions']",
                    :name => "print_button_header",
                    :text => "<th>print</th>")

Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_row_actions']",
                    :name => "print_button_link",
                    :text => %q{<td><%= link_to "Print", pdf_invoice_prints_path(:order_id => order.id, :format => :pdf) %></td>})

# User Show Account buttons
Deface::Override.new(:virtual_path => %q{spree/users/show},
                    :insert_after => "table.order-summary thead tr th:last",
                    :name => "print_button_header",
                    :text => "<th>INVOICE</th>")

Deface::Override.new(:virtual_path => %q{spree/users/show},
                    :insert_after => "table.order-summary tbody tr td:last",
                    :name => "print_button_link",
                    :text => %q{<td><%= link_to "Print", user_pdf_invoice_prints_path(:order_id => order.id, :format => :pdf) %></td>})
