#/!/bin/bash

BASE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd "${BASE_DIR}" || exit

cat <<EOF > .Rprofile
options(BioC_MIRROR="https://mirrors.ustc.edu.cn/bioc")
options( "repos" = c(CRAN="https://mirrors.ustc.edu.cn/CRAN/"))
EOF

Rscript packages.R
rm .Rprofile
