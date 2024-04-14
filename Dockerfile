FROM gcc:latest

WORKDIR /app

COPY . .

# Posodobitev repozitorijev in namestitev potrebnih knjižnic
RUN apt-get update -qq && \
    apt-get install -f && \
    apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-thread-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Prevedite vaš C++ program
RUN g++ -c vaja2.cpp -o vaja2.o
RUN g++ test_vaja2.cpp vaja2.o -o test

CMD ["./test"]
