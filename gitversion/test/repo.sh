# --------------------------------------------
# create example repo for testing git version
# --------------------------------------------

#!/bin/bash
set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes

# create example repo
mkdir /repo && cd /repo && git setup

# create feature branch 1 and add one commit
git feature feature-brach-1
touch file-1 && git add file-1 && git commit -m "added file 1"

# merge feature branch 1 into master
git checkout master && git merge feature/feature-brach-1

# create version 0.1.0
git tag 0.1.0

# create feature branch 2 and add two commits
git feature feature-2
touch file-2 && git add file-2 && git commit -m "added file 2"
touch file-3 && git add file-3 && git commit -m "added file 3"

# create feature branch 3 and add one commit
git checkout master && git feature feature-3
touch file-4 && git add file-4 && git commit -m "added file 4"

# merge feature branch 2 inte master
git checkout master && git merge feature/feature-2

# create version 1.0.0
git tag 1.0.0
