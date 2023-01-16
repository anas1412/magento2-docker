### Setting Up Magento 2 on Multi-container Architecture Using Docker-Compose tool

This repository is a part of my end of studies internship.

<p align="center">
    <img align="center" alt="visitors" src="https://github.com/anas1412/magento2-docker/blob/main/images/IMG-01.jpg" width="900"/>
</p>

#### Docker-Compose Tool

As mentioned in Docker docs, Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application’s services. Then, using a single command, you create and start all the services from your configuration.

With the help of docker-compose we can define containers to be built, their configuration, links, volumes, ports etc in a single file and it gets launched by a single command. We can add multiple servers and services just by adding them to docker-compose configuration file. This configuration file is in YAML format.

<p align="center">
    <img align="center" alt="visitors" src="https://github.com/anas1412/magento2-docker/blob/main/images/IMG-03.jpg" width="900"/>
</p>

Getting started with docker-compose is a few steps process:

> Create a Dockerfile defining the application environment. We can create separate Dockerfile for our different services. As Dockerfile are lightweight, so our application can be replicated anywhere.

> Create a docker-compose.yml file defining services that needed for application run. We can define volumes to be mapped, ports to be exposed, links to be created, arguments to be passed etc in our docker-compose.yml file.

> Run ‘docker-compose build’ to create Docker image. After creating Dockerfile, docker-compose.yml and placing our volumes at right places, we can create our image.

> Run ‘docker-compose up -d’ to run the docker containers. After image build up, we can run all of our containers as mentioned in configuration files by this single command.

#### Dockerizing Magento 2 with Docker-Compose

Docker is an open-source project that can be integrated with almost all the applications allowing scope of isolation and flexibility. It can be integrated with Magento 2 as well. Magento is an e-commerce platform written in PHP and based on zend framework available under both open-source and commercial licenses.

In this project, we are using:

> Operating system: Ubuntu 20.04

> Web Server: Apache2

> Database Server: Mysql-server-8.0

> PHP version: PHP-7.4

<p align="center">
    <img align="center" alt="visitors" src="https://github.com/anas1412/magento2-docker/blob/main/images/IMG-02.jpg" width="900"/>
</p>

To begin with, please install docker and docker-compose on your ubuntu 20.04 server.

Then follow the following steps:

1). Clone or download this repository as

> git clone https://github.com/anas1412/magento2-docker.git

2. Set mysql root credentials and name of the database to be created . Go to ~/magento2-docker-compose/docker-compose.yml and change mysql root password in database_server in:

> mysql_password=

> mysql_database=

3). Download Magento 2 version you wish to dockerize and upload it in directory magento2 in parallel docker-compose.yml.

> Go to https://magento.com/tech-resources/download? .

4). Build the docker image.

> docker-compose build

6). Check the built image as:

> docker images

7). Run the containers from built image as:

> docker-compose up -d

8). Check the running docker containers by command:

> docker-compose ps

> docker ps

Now, your server setup is all ready, now hit your domain name or IP to install Magento 2. For more details.

#### GETTING SUPPORT

If you have any issues, contact me at anas.bassoumi@gmail.com.

I will be happy to help.
