FROM cluster-base

# -- Layer: app

ARG spark_version=3.0.0

ARG matplotlib_version=3.5.2

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install pyspark==${spark_version} matplotlib==${matplotlib_version}

# -- Runtime

WORKDIR /opt/native_apps

CMD ["python3", "main.py"]
