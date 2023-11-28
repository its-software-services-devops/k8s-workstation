# Running xmrig on docker-compose
## Install docker and docker-compose
Docker and docker-compose need to be in placed. If not, we may use the commands below to install them. I'm assuming that the Ubuntu is being used.
```
curl https://releases.rancher.com/install-docker/20.10.sh | sudo sh
sudo apt install docker-compose
```

# Running xmrig on Kubernetes
## Install Helm
We will use Helm to install xmrig into the existing Kubernetes cluster. I'm assuming that the Ubuntu is being used.
```
sudo snap install helm --classic 
```
# Dockerfile
There are 3 main components that are installed in the docker image.
* __xmrig__ This is xmrig itself.
* __tor__  This is tor proxy to make xmrig able to connect to pool via tor proxy.
* __supervisor__ - To make xmrig and tor able to run together in the same container.

# Environment Variables
* __ADDRESS__ - This is your wallet address. Use this one *bc1q8wyyu6dlngxltel0mhtkxnwngga7njtjuugd4w* if you want to donate me some BTC.
* __WORKER_ID__ - This is your worker ID.
* __SOCK5_ADDRESS__ - This is proxy address, by default it is pointing to local tor proxy (127.0.0.1:9050).
* __URL__ - This is your pool URL, I use rx.unmineable.com:3333 as the default value.
* __CODE__ - This is code of your coin, BTC is the default value.
* __REF_CODE__ - Commission reference code. Please use *r6yz-adfj* for BTC mining via *unmineable.com* pool.
