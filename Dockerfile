FROM rocker/rstudio

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y git \
&& apt-get install -y libreoffice \
&& apt-get install -y texlive-full texlive-xetex \
&& echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
&& apt-get install -y ttf-mscorefonts-installer \
&& apt-get clean all && \
apt-get purge && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN Rscript -e "install.packages(c('rmarkdown', 'markdown', 'tidyverse', 'sjlabelled', 'haven', 'magrittr', 'dplyr', 'psych'));"

#COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/user-settings
#COPY .Rprofile /home/rstudio/