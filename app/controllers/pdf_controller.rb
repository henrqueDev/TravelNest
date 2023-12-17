
class PdfController < ApplicationController
    def index
      # Cria um novo objeto PDF
      pdf = Prawn::Document.new
  
      # Adiciona uma página ao PDF
      pdf.add_page
  
      # Adiciona uma imagem ao PDF
      #pdf.image("image.png", x=50, y=50)
  
      # Adiciona texto ao PDF
      pdf.set_font("Arial", size=12)
      pdf.cell(200, 20, "Este é um documento PDF criado pelo Ruby on Rails com uma imagem.")
  
      # Retorna o PDF
      render pdf: pdf.render
    end
end
  