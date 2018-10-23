FROM gradle:jdk8

LABEL maintainer <alexander.malic@maastrichtuniversity.nl>

USER root

WORKDIR /app

COPY . .

RUN gradle build -x check -x processTestResources -x testClasses -x checkstyleTest && \
  mkdir /data && ln -s /data output && ls -al output

# Run the app once, because subsequent builds will be faster
# RUN gradle -a run && rm -rf ./output/*

ENTRYPOINT ["gradle", "-a", "run" , "-x", "compileJava"]