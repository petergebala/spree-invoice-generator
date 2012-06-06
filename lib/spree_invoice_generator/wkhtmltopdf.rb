module SpreeInvoiceGenerator
  module WKHTMLToPDF

    def self.bin_path
      bin_path = `which wkhtmltopdf`
      raise LoadError, "WKHTMLtoPDF not found. Please install it first (http://code.google.com/p/wkhtmltopdf/)" if bin_path.empty?
      bin_path.gsub(/\n/, '')
    end

  end
end
