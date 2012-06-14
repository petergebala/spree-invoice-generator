# User Show Account buttons
Deface::Override.new(:virtual_path => %q{spree/users/show},
                    :insert_after => "table.order-summary thead tr th:last",
                    :name => "print_button_header",
                    :text => "<th><%= t(:invoice, :scope => :spree) %></th>")

Deface::Override.new(:virtual_path => %q{spree/users/show},
                    :insert_after => "table.order-summary tbody tr td:last",
                    :name => "print_button_link",
                    :text => %q{
                      <td><%= link_to t(:show, :scope => :spree), pdf_invoice_prints_path(:order_id => order.id, :format => :html), :onclick => "window.open(this.href, '#{t(:invoice, :scope => :spree)}', 'width=595,height=842,left=100,top=100'); return false;" %></td>
                      <td><%= link_to t(:download, :scope => :spree), pdf_invoice_prints_path(:order_id => order.id, :format => :pdf) %></td>
                    })
