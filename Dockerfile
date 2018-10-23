FROM gradle:jdk8

LABEL maintainer <alexander.malic@maastrichtuniversity.nl>

USER root

WORKDIR /app

COPY . .

RUN gradle build -x check -x processTestResources -x testClasses -x checkstyleTest && \
  mkdir /data && ln -s /data output && ls -al output

ENTRYPOINT ["gradle", "-a", "run" , "-x", "compileJava"]
