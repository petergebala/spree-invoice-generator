Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_header_actions']",
                    :name => "print_button_header",
                    :text => "<th>print</th>")

Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_row_actions']",
                    :name => "print_button_link",
                    :text => %q{<td><%= link_to "Print", "##{order.id}" %></td>})
