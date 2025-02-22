FROM squidfunk/mkdocs-material:7.1.8 as builder

RUN apk add --no-cache --update nodejs npm

WORKDIR /site
COPY ./ /site/

# Python Dependencies
RUN pip --no-cache-dir install git+https://github.com/linkchecker/linkchecker@v10.0.1#egg=linkchecker

FROM bitnami/nginx

#RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

#RUN apt-get install -y nodejs

USER root

#RUN mkdir -p /site/public

#EXPOSE 8080 8443
#COPY --from=builder /site/public /app
