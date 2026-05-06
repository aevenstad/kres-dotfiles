export APPTAINER_CACHEDIR="/bigdata/Jessin/Softwares/.apptainer"
export NXF_APPTAINER_CACHEDIR="/bigdata/Jessin/Softwares/containers"
export NXF_SINGULARITY_CACHEDIR="/bigdata/Jessin/Softwares/containers"

export KRAKEN_DEFAULT_DB="/bigdata/Jessin/Database/minikraken_20171013_4GB/"
export KRAKEN2_DEFAULT_DB="/bigdata/Jessin/Database/minikraken2_v1_8GB/"
export CENTRIFUGE_DEFAULT_DB="/bigdata/Jessin/Database/centrifuge-db/p_compressed+h+v"

path_prepend_if_dir "/bigdata/Jessin/Scripts/illumina_kres/scripts"
path_prepend_if_dir "/bigdata/Jessin/Scripts/wrapper_scripts"
path_prepend_if_dir "/bigdata/Jessin/Softwares/containers"
export PATH

if command -v keychain >/dev/null 2>&1; then
  eval "$(keychain --quiet --eval id_ed25519_kres-pc id_ed25519_kres-pc_github 2>/dev/null)"
fi

alias ca="source /bigdata/Jessin/Softwares/anaconda3/bin/activate"
alias search_fastq="python3 /home/andreas/Documents/fastq_search/backend/copy_fastq.py"
alias seqp="cd /bigdata/Jessin/Sequencing_projects/andreas"
alias soft="cd /bigdata/Jessin/Softwares"
alias scripts="cd /bigdata/Jessin/Scripts"
alias ass="cd /bigdata/Jessin/Softwares/nextflow_pipeline/assembly_amr"
