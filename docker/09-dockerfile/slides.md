%title: LEARN DOCKER
%author: xavki

# 09 DOCKER : DOCKERFILE

<br>

Purpose :

		* how create a docker image withe Dockerfile

--------------------------------------------------------------------------------

# 09 DOCKER : DOCKERFILE


<br>

Dockerfile > specific file that describe an image

		* describe each instruction

		* to set a specific order

		* can version with git

		* add some variables to reuse it

--------------------------------------------------------------------------------

# 09 DOCKER : DOCKERFILE

<br>

Main instructions :

	* FROM : which image to use to create your image

	* RUN : to run simple commands

	* ENV : to set environment variables

	* COPY : to copy a file from the source directory into the image

	* ENTRYPOINT : to define the main process

	* CMD : to define main process or options

	* EXPOSE : which port do you want to expose by default (optionnal)

	* VOLUME : which volume to mount by default


