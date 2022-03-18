ARG RUBYIMAGE_VERSION=2.6.6-alpine3.12
FROM ruby:${RUBYIMAGE_VERSION}
ARG RUBYIMAGE_VERSION

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV CACERTIFICATES_VERSION="20191127-r4" \
    GIT_VERSION="2.26.2-r0" \
    INSPEC_VERSION="4.23.15" \
    KITCHEN_VERSION="2.2.1" \
    KITCHEN_ANSIBLE_VERSION="0.52.0" \
    KITCHEN_TERRAFORM_VERSION="5.5.0" \
    KITCHEN_CLOUDFORMATION_VERSION="1.5.0" \
    KITCHEN_EC2_VERSION="3.8.0" \
    OPENSSH_VERSION="8.3_p1-r0" \
    TERRAFORM_VERSION="0.11.14"

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="kitchen" \
      "org.label-schema.base-image.name"="docker.io/library/ruby" \
      "org.label-schema.base-image.version"=$RUBYIMAGE_VERSION \
      "org.label-schema.description"="Kitchen in a container" \
      "org.label-schema.url"="https://kitchen.ci/" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-kitchen" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.kitchen.version"=$KITCHEN_VERSION \
      "org.label-schema.applications.ca-certificates.version"=$CACERTIFICATES_VERSION \
      "org.label-schema.applications.inspec.version"=$INSPEC_VERSION \
      "org.label-schema.applications.git.version"=$GIT_VERSION \
      "org.label-schema.applications.kitchen-ansible.version"=$KITCHEN_ANSIBLE_VERSION \
      "org.label-schema.applications.kitchen-terraform.version"=$KITCHEN_TERRAFORM_VERSION \
      "org.label-schema.applications.kitchen-cloudformation.version"=$KITCHEN_CLOUDFORMATION_VERSION \
      "org.label-schema.applications.openssh.version"=$OPENSSH_VERSION \
      "org.label-schema.applications.terraform.version"=$TERRAFORM_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Please see README.md"
