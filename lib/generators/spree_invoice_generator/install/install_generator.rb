module SpreeInvoiceGenerator
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../../', __FILE__)

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_invoice_generator'
      end

      def run_migrations
         res = ask ">> Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'bundle exec rake db:migrate'
         else
           puts ">> Skiping rake db:migrate, don't forget to run it!"
         end
      end

      def generate_missing_records
        puts ">> Generating missing records..."
        run 'bundle exec rake spree_invoice_prints:generate'
      end

      def copy_templates
        puts ">> Copy invoice template"
        copy_file (File.expand_path('../../../../../app/views/invoice_prints/', __FILE__) + "/invoice_template.html.erb"), "app/views/invoice_prints/invoice_template.html.erb"
      end

      def copy_config
        puts ">> Copy config file"
        copy_file (File.expand_path('../../../../../config/initializers/', __FILE__) + "/spree_invoice_generator.rb"), "config/initializers/spree_invoice_generator.rb"
        puts "\n>>> Don't forget to check your config file! <<<"
      end
    end
  end
end
