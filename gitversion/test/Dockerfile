FROM docker:19.03-git

RUN apk add --no-cache --update alpine-sdk bash util-linux

# install git-extras
RUN git clone https://github.com/tj/git-extras.git && \
    cd git-extras && \
    git checkout $(git describe --tags $(git rev-list --tags --max-count=1)) && \
    make install && \
    rm -rf ../git-extras

COPY repo.sh /repo.sh
RUN chmod +x /repo.sh
RUN git config --global user.email "test@test.com" && \
    git config --global user.name "Test Runner"
RUN /repo.sh