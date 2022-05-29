FROM ubuntu:latest

LABEL version="1.2.0"
LABEL name="setup-kubectl"
LABEL repository="http://github.com/cuzfrog/setup-kubectl"
LABEL homepage="http://github.com/cuzfrog/setup-kubectl"

LABEL maintainer="Cause Chung <cuzfrog@gmail.com>"
LABEL com.github.actions.name="Setup kubectl"
LABEL com.github.actions.description="Setup kubectl and run."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

RUN apt update
RUN apt install -y curl gettext

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
