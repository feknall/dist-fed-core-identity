FROM bcgovimages/von-image:py36-1.15-1

USER root

COPY . /project
WORKDIR /project

ENV PYTHONPATH=${PYTHONPATH}:/project
ENV LEDGER_URL=http://localhost:9000
ENV GENESIS_FILE=/project/von-network/genesis/genesis.txt

COPY --from=golang:1.18 /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV PATH="$GOPATH/bin:${PATH}"

RUN go version

RUN apt-get update && apt-get install -y iputils-ping libtool libltdl-dev git
RUN curl -sSL https://bit.ly/2ysbOFE --output script.sh
RUN chmod +x script.sh && ./script.sh -d -s && cp bin/fabric-ca-client /usr/local/bin
RUN fabric-ca-client version

RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r /project/requirements.txt