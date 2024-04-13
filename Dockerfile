FROM gcc:latest

WORKDIR /app

COPY . .

RUN g++ -o vaja2 vaja2.cpp

CMD ["./vaja2"]
