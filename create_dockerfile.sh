#!/bin/bash
docker run --rm kaczmarj/neurodocker:master generate docker \
           --base neurodebian:stretch-non-free \
           --pkg-manager apt \
           --install fsl gcc g++ graphviz tree less ncdu tig swig wget git-annex-standalone git-annex-remote-rclone \
           --add-to-entrypoint "source /etc/fsl/fsl.sh" \
           --user=neuro \
           --workdir /home/neuro \
           --miniconda miniconda_version="4.3.31" \
             conda_install="python=3.6 pytest jupyter jupyterlab jupyter_contrib_nbextensions
                            traits pandas matplotlib scikit-learn scikit-image seaborn nbformat nb_conda" \
             pip_install="https://github.com/nipy/nipype/tarball/master
                          nilearn datalad[full] nipy nibabel nbval" \
             create_env="neuro" \
             activate=True \
           --env LD_LIBRARY_PATH="/opt/miniconda-latest/envs/neuro:$LD_LIBRARY_PATH" \
           --run-bash "source activate neuro && jupyter nbextension enable exercise2/main && jupyter nbextension enable spellchecker/main" \
           --user=root \
           --run 'mkdir /data && chmod 777 /data && chmod a+s /data' \
           --run 'mkdir /output && chmod 777 /output && chmod a+s /output' \
           --user=neuro \
           --run 'printf "[user]\n\tname = miykael\n\temail = michaelnotter@hotmail.com\n" > ~/.gitconfig' \
           --run-bash 'source activate neuro && cd /data && datalad install -r ///workshops/nih-2017/ds000114 && cd ds000114 && datalad update -r && datalad get -r sub-0[234789]/ses-test/anat/sub-0[234789]_ses-test_T1w.nii.gz sub-0[234789]/ses-test/func/*fingerfootlips*' \
           --run 'chown -R neuro /home/neuro' \
           --run 'rm -rf /opt/conda/pkgs/*' \
           --copy . "/home/neuro/." \
           --run 'mkdir -p ~/.jupyter
                  && echo c.NotebookApp.ip = \"0.0.0.0\" > ~/.jupyter/jupyter_notebook_config.py' \
           --user=root \
           --run 'chown -R neuro /home/neuro' \
           --user=neuro \
           --workdir /home/neuro \
           --cmd "jupyter-notebook" > Dockerfile
