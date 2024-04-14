FROM gcc:latest

WORKDIR /app

COPY . .

RUN g++ -o test test_naloga2.cpp

CMD ./test
