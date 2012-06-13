# User Show Account buttons
Deface::Override.new(:virtual_path => %q{spree/users/show},
                    :insert_after => "table.order-summary thead tr th:last",
                    :name => "print_button_header",
                    :text => "<th><%= t(:invoice, :scope => :spree) %></th>")

Deface::Override.new(:virtual_path => %q{spree/users/show},
                    :insert_after => "table.order-summary tbody tr td:last",
                    :name => "print_button_link",
                    :text => %q{<td><%= link_to t(:print, :scope => :spree), pdf_invoice_prints_path(:order_id => order.id, :format => :pdf) %></td>})
