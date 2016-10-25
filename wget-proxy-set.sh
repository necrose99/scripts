# /etc/wgetrc
### For Gentoo , Sabayon , Centos , Debian behind corp firewalls , this will fix Wget gloabllay , note needs root privlages.
## Examples 
#https_proxy = http://proxy.yoyodyne.com:18023/
#http_proxy = http://proxy.yoyodyne.com:18023/
#ftp_proxy = http://proxy.yoyodyne.com:18023/
#
### Uncoment below to set the company proxy relavant to you, FQDN/host/IP ports. 
#### FTP proxy is seldom of use but may be relavant to some.

# echo use_proxy = on >> /etc/wgetrc
## enable for above to set proxy Proxy on , un coment.  
# echo https_proxy = http://proxy.yoyodyne.com:18023/ >> /etc/wgetrc
## Append HTTP proxy to global wgetrc
# echo https_proxy = http://proxy.yoyodyne.com:18023/ >> /etc/wgetrc
## Append HTTPS proxy to global wgetrc
#
#
### FTP proxy some corps discourage it harder to secure. 
# echo ftp_proxy = http://proxy.yoyodyne.com:18023/ >> /etc/wgetrc
