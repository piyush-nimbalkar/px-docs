#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE="${DIR}/.."
WEBIP='portworx.com'

WEBSITECONTENT=$(wget -qO- --no-check-certificate --header="Host: portworx.com" https://${WEBIP}/)

TOPNAV=$(echo ${WEBSITECONTENT} | pup 'nav')
FOOTER=$(echo ${WEBSITECONTENT} | pup 'footer')

echo ${TOPNAV} > "${BASE}/_includes/topnav.html"
echo ${FOOTER} > "${BASE}/_includes/footer.html"

CSS=$(wget -qO "${BASE}/_sass/marketing-styles.scss" --no-check-certificate --header="Host: portworx.com" https://${WEBIP}/wp-content/themes/portworx/css/master.css)

gsed -ir 's/@charset "UTF-8";//' "${BASE}/_sass/marketing-styles.scss"
