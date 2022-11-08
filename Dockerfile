FROM bcgovimages/von-image:py36-1.15-1

USER root

COPY . /project
WORKDIR /project

ENV PYTHONPATH=${PYTHONPATH}:/project
ENV LEDGER_URL=http://localhost:9000
ENV GENESIS_FILE=/project/von-network/genesis/genesis.txt

RUN apt-get update && apt-get install -y iputils-ping libtool libltdl-dev git
RUN curl -OL https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xvf go1.19.3.linux-amd64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

RUN git clone https://github.com/hyperledger/fabric-ca.git
RUN cd fabric-ca && go get -u github.com/hyperledger/fabric-ca/cmd/...
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r /project/requirements.txt