
class PdfController < ApplicationController
    def index
      pdf = Prawn::Document.new
      pdf.add_page
      pdf.set_font("Arial", size=12)
      pdf.cell(200, 20, "")
  
      # Retorna o PDF
      render pdf: pdf.render
    end
end
  