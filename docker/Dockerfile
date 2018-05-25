FROM certbot/dns-google:v0.24.0
MAINTAINER tei1988

WORKDIR /

ENV CLOUD_SDK_VERSION 198.0.0
ENV PATH /google-cloud-sdk/bin:$PATH

RUN apk --update --no-cache upgrade && \
    apk --no-cache add curl python py-crcmod bash libc6-compat openssh-client git && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version
