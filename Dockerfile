FROM python:2

WORKDIR /usr/src/app

# Dependencies
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

WORKDIR /usr/src/app/xcoin-hash
RUN python setup.py install

WORKDIR /usr/src/app/X13-PythonHash
RUN python setup.py install

WORKDIR /usr/src/app/x15_hash
RUN python setup.py install

WORKDIR /usr/src/app
ENTRYPOINT [ "python", "genesis.py" ]
