FROM gcc:latest

WORKDIR /app

COPY . .

RUN g++ -o test test_vaja2.cpp

CMD ["./test"]
