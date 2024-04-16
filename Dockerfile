FROM public.ecr.aws/docker/library/maven:3.6.3-jdk-11

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mkdir -p /usr/src/app/target
RUN mvn install -DskipTests
