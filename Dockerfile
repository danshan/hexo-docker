FROM centos:7
ENV LANG C.UTF-8
ENV NEXT_TAG v6.2.0

LABEL author=shanhh email=i@shanhh.com site=https://www.shanhh.com

WORKDIR /opt/hexo
RUN yum install -y git \
  && yum install -y epel-release \ 
  && yum install -y nodejs \
  && npm config set registry https://registry.npm.taobao.org \
  && npm install hexo-cli -g  \
  && hexo init shanhh \
  && cd shanhh \
  && npm install hexo-qiniu-sync --save \
  && npm install hexo-generator-feed --save \
  && npm install hexo-generator-sitemap --save \
  && npm install hexo-symbols-count-time --save \
  && npm install hexo-generator-searchdb --save \
  && npm install \
  && git clone --branch ${NEXT_TAG} https://github.com/theme-next/hexo-theme-next themes/next \
  && git clone https://github.com/theme-next/theme-next-pace themes/next/source/lib/pace \
  && git clone https://github.com/theme-next/theme-next-canvas-nest themes/next/source/lib/canvas-nest 
