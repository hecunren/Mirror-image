# 基础镜像
FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel

# 添加NVIDIA GPG公钥
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libpci-dev \
    curl \
    nano \
    psmisc \
    zip \
    git \
    libcairo2-dev && \
    apt-get --fix-broken install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装Conda包
RUN conda install -y \
    faiss-gpu \
    scikit-learn \
    pandas \
    flake8 \
    yapf \
    isort \
    yacs \
    gdown \
    future \
    libgcc \
    numpy=1.16.1 \
    -c conda-forge

# 安装Python库
RUN pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install \
    torch==1.4.0 \
    torchvision==0.5.0 \
    matplotlib \
    svgwrite \
    cairosvg \
    IPython \
    "six>=1.12.0" \
    tensorflow \
    tensorboardX \
    pillow \
    svglib \
    tqdm \
    jupyter \
    scikit-image \
    networkx \
    moviepy \
    numba \
    sklearn \
    umap-learn \
    "umap-learn[plot]" \
    shapely \
    kivy \
    opencv-python \
    tb-nightly \
    matplotlib \
    logger_tt \
    tabulate \
    wheel \
    mccabe \
    scipy

# 复制字体文件
COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
