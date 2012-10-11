module SpreeInvoiceGenerator
  # TODO
  # - move path to config file
  module WKHTMLToPDF
    def self.bin_path
      # TODO
      # - nice but it gonna work only with Unix based system. What if someone have couple wkhtml binaries and want to use custom one...
      bin_path = `which wkhtmltopdf`
      raise LoadError, "WKHTMLtoPDF not found. Please install it first (http://code.google.com/p/wkhtmltopdf/)" if bin_path.empty?
      bin_path.gsub(/\n/, '')
    end
  end
end
