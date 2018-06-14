# pedroburon/pyter

My personal python docker image

## Usage

* `docker run -it pedroburon/pyter`
* `docker run -it pedroburon/pyter:2` for python 2
* `docker run -it pedroburon/pyter:3-ipython ipython` for ipython
* `docker run -it pedroburon/pyter:2-ipython ipython` for ipython with python 2


## Extra requirements

You can mount a volume into /src folder, if requirements.txt is present `pip install -r requirements.txt` will be executed.

`docker run -v $PWD:/src -it pedroburon/pyter`
