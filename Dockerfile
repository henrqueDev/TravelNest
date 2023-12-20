# Use uma imagem base que já contenha o Ruby e o ambiente necessário para o Rails
FROM ruby:3.2.2

# Atualize o sistema e instale dependências
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client

# Crie um diretório de trabalho
WORKDIR /app

# Copie os arquivos de configuração e instale as gems antes do restante do código para aproveitar o cache
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copie o restante dos arquivos para o contêiner
COPY . .

# Exponha a porta padrão do Rails
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
