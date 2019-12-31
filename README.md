# lewa
A simple way to combine data + templates with containers.

To get more information on how to build the templates and run command, see the documentaion on Gomplate

https://github.com/hairyhenderson/gomplate

# Setup

1. Add your data in the data folder (yaml, json, etc...)
2. Build your templates and store them in the templates folder
3. Edit your run.sh file
4. Build using Docker: `docker build -t <name_of_image> .`

# Use
`docker run <name_of_image>`
