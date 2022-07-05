FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=3.0.0

ARG jupyterlab_version=2.1.5

ARG matplotlib_version=3.5.2

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} matplotlib==${matplotlib_version}

# -- Runtime

EXPOSE 8888

WORKDIR /opt/jupyterlab_apps

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
