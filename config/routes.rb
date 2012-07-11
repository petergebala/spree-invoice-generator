Spree::Core::Engine.routes.draw do
  match '/invoice_prints/show/:order_id' => 'invoice_prints#show', :as => :pdf_invoice_prints
end
