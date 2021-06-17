FROM quay.io/fenicsproject/stable:latest

# create user with a home directory
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}

# COPY install files since we are installing without pip!
#COPY --from=builder --chown=$NB_UID:$NB_UID /root/.local $HOME/.local

ARG NB_USER=fenics
ARG NB_UID=1000

USER root
RUN useradd -d ${HOME} --shell /bin/bash -u ${NB_UID} -o -c "" -m ${NB_USER} && \
    chown -R ${NB_USER} ${HOME} /root/.local



#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}
WORKDIR ${HOME}
USER ${NB_USER}
# Workaround matplotlib segfaulting with cold cache
RUN python -c "from matplotlib import pyplot"


