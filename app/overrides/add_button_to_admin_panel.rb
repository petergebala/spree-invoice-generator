# Admin Panel buttons
Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_header_actions']",
                    :name => "print_button_header",
                    :text => "<th><%= t(:invoice, :scope => :spree) %></th>")

Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                    :insert_after => "[data-hook='admin_orders_index_row_actions']",
                    :name => "print_button_link",
                    :text => %q{
                      <td>
                        <%= link_to "#{image_tag('admin/icons/receipt.png')} #{t(:show, :scope => :spree)}".html_safe, pdf_invoice_prints_path(:order_id => order.id, :format => :html), :onclick => "window.open(this.href, '#{t(:invoice, :scope => :spree)}', 'width=745,height=892,left=100,top=100,menubar=no,toolbar=yes,scrollbars=yes,location=no,hotkeys=yes'); return false;" %>&nbsp;
                        <%= link_to "#{image_tag('admin/icons/pdf.png')} #{t(:download, :scope => :spree)}".html_safe, pdf_invoice_prints_path(:order_id => order.id, :format => :pdf) %>
                      </td>
                    })

# In Order#show
Deface::Override.new(:virtual_path => %q{spree/admin/orders/show},
                    :insert_bottom => "[data-hook='admin_order_show_buttons']",
                    :name => "print_button_link",
                    :text => %q{<%= button_link_to t(:print_invoice, :scope => :spree), pdf_invoice_prints_path(:order_id => @order.id, :format => :pdf), :icon => 'pdf' %>})
