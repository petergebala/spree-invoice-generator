namespace :spree_invoice_prints do
  desc "Migrating and connecting Spree::Orders with InvoicePrints"
  task :generate => :environment do
    sum     = Spree::Order.count
    counter = 0
    Spree::Order.all.each do |e| 
      e.send(:add_invoice_print)

      counter += 1
      print "\r#{counter}/#{sum}"
    end

    print "\nDone.\n"
  end
end
