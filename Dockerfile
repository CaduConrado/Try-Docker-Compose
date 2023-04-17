# syntax=docker/dockerfile:1
#cria uma imagem rodando com Python 3.7
FROM python:3.7-alpine
#seta o diretório para /code
WORKDIR /code
#seta o ambiente de variáveis usadas com o comando flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
#Instala o gcc e outras dependências
RUN apk add --no-cache gcc musl-dev linux-headers
#copia o arquivo requirements.txt e instala as depedências do Python
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
#adiciona os metadados à imagem e informa que o container está sendo escutado na porta 5000
EXPOSE 5000
#copia o diretório atual para o workdir da imagem
COPY . .
#seta o comandao padrão para o container para flask run
CMD ["flask", "run"]