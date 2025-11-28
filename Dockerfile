FROM node:18-alpine

# Criar diretório da aplicação
WORKDIR /app

# Copiar arquivos essenciais
COPY package.json package-lock.json* yarn.lock* ./

# Instalar dependências
RUN npm install

# Copiar restante do projeto
COPY . .

# Build do Strapi (precisa se for produção)
RUN npm run build

# Expor porta do Strapi
EXPOSE 1337

# Rodar Strapi
CMD ["npm", "run", "develop"]
