
# 基础镜像
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel


RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

#安装系统依赖
RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

# 安装Conda包
RUN conda install -y \
    faiss-gpu \
    scikit-learn \
    flake8 \
    yapf \
    isort \
    yacs \
    gdown \
    future \
    libgcc \
    -c conda-forge

# 安装Python库
RUN pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install \
    numpy=1.16.1 \
    matplotlib \
    svgwrite \
    cairosvg \
    IPython \
    six>=1.12.0 \
    tensorflow \
    tensorboardX \
    pillow \
    pandas \
    svglib \
    tqdm \
    jupyter \
    scikit-image \
    networkx \
    moviepy \
    numba \
    sklearn \
    umap-learn \
    umap-learn[plot] \
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
