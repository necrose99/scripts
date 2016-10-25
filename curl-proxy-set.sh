cat >>/home/$user/.curlrc <<CURLRC
cat >>/etc/skel/.curlrc <<CURLRC
cat >>/root/.curlrc <<CURLRC
## make Curl Less anyoing when behind corperate proxy. 
## http://stackoverflow.com/questions/7559103/how-to-setup-curl-to-permanently-use-a-proxy 
## curl is Fuming irritating and will inore any proxy exports at times and gets really irritating typing it in always.
## this is a failsafe methoid for Curl. 
## (Example) proxy = myproxy.mycorp.net:8080 (<proxy_host>:<proxy_port>) FQDN/Host or IP.. 
## Edit and uncoment Below with your proxy config data. 

## proxy = myproxy.mycorp.net:8080
CURLRC

## set for Curent user
## add a skel entery for any new users
## add for ROOT.
