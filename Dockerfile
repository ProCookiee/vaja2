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
RUN g++ -o test test_naloga2.cpp

CMD ["./test"]
