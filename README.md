# wecenter-dockerfile

WeCenter Docker Image with Mobile API

## Include

- WeCenter 3.1.7: [wecenter/wecenter](https://github.com/wecenter/wecenter)

- WeCenter Mobile API for  3.1.7: [ifLab/WeCenterMobile-Api](https://github.com/ifLab/WeCenterMobile-Api/)

- phpMyAdmin 4.1.7: [phpmyadmin/phpmyadmin](https://github.com/phpmyadmin/phpmyadmin)

## Usage

### [Install Docker CE](https://docs.docker.com/engine/installation/linux/ubuntu/)

### Build Docker Image

```
git clone https://github.com/ZhangZhenghao/wecenter-dockerfile.git
cd wecenter-dockerfile
sudo docker build . -t='<your image name>'
```

### Run image

```
sudo docker run -d -t -p 8000:80 <your image name>
```
