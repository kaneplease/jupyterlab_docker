# pytorchのイメージをダウンロード
FROM nvcr.io/nvidia/pytorch:21.07-py3
ENV PYTHONUNBUFFERED=1

# MySQL mecab用環境設定
RUN apt-get update && apt-get install -y \
    python3-dev \
    libmysqlclient-dev mysql-client \
    mecab mecab-ipadic-utf8 libmecab-dev

# jupyterlab用環境設定
RUN conda install nodejs
RUN pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

WORKDIR /src

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
