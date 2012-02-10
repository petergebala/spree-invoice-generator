Spree::Core::Engine.routes.draw do
  match '/invoice_prints/get_pdf' => 'invoice_prints#get_pdf', :as => :pdf_invoice_prints
  match '/invoice_prints/get_user_pdf' => 'invoice_prints#get_user_pdf', :as => :user_pdf_invoice_prints
end
