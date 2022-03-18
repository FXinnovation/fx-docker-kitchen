FROM ruby:2.6.3-alpine3.9

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV CACERTIFICATES_VERSION="20190108-r0" \
    GIT_VERSION="2.20.1-r0" \ 
    INSPEC_VERSION="4.3.2" \
    KITCHEN_VERSION="2.2.0" \
    KITCHEN_ANSIBLE_VERSION="0.49.1" \
    KITCHEN_TERRAFORM_VERSION="4.8.0" \
    KITCHEN_CLOUDFORMATION_VERSION="1.4.1" \
    OPENSSH_VERSION="7.9_p1-r5" \
    TERRAFORM_VERSION="0.11.13"

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="kitchen" \
      "org.label-schema.base-image.name"="docker.io/library/ruby" \
      "org.label-schema.base-image.version"="2.6.3-alpine3.9" \
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
