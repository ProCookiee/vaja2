FROM gcc:latest

WORKDIR /app

COPY . .

RUN apt-get update -qq && \
    apt-get install -y libboost-all-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN g++ -o test test_naloga2.cpp

CMD ["./test"]
