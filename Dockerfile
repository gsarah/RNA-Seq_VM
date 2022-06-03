# An example of extension of the jupyter stack 'datascience-notebook'
# with pip modules ('pip install ...') and their system dependancies ('apt-get install -y ...')
FROM jupyter/datascience-notebook
USER root
RUN apt update
RUN apt install -y python3-all-dev python3-pip python3-venv
RUN apt install -y python3-pyqt5 pyqt5-dev-tools qttools5-dev-tools
RUN pip install PyQt5 ete3 owlready2 pyproteinsExt ipympl jupyterlab

#Adding dedicated kernel
RUN python3 -m pip install --upgrade ipython
RUN python3 -m pip install bash_kernel
RUN python3 -m bash_kernel.install

ENV JUPYTER_ENABLE_LAB=yes

#Install for non-specific ONT 
RUN apt install -y unzip wget build-essential cmake git-all tar gzip

#Dedicated install to RNA-Seq analyses, packed

RUN apt install -y samtools
RUN conda create -n fastqc -c bioconda fastqc
RUN conda create -n star -c bioconda star
RUN conda create -n fastp -c bioconda fastp
RUN conda create -n htseq -c bioconda htseq