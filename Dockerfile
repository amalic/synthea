FROM gradle

LABEL maintainer <alexander.malic@maastrichtuniversity.nl>

USER root

WORKDIR /app

COPY . .

RUN ./gradlew build -x compileTestJava -x processTestResources -x testClasses -x checkstyleTest

RUN mkdir /data && ln -s /data output

ENTRYPOINT ["./run_synthea"]
