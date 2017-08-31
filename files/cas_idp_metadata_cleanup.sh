#!/usr/bin/env bash

# a very quick and dirty cleanup of the IdP metadata as described here:
# https://apereo.github.io/cas/5.0.x/installation/Configuring-SAML2-Authentication.html#idp-metadata

# takes full path of idp-metadata.xml as an argument.
# Prints massaged metadata to stdout.
# Do with it what you will.

cat $1 | sed -n 'H
$ {g
   s/<\!--/²/g;s/-->/³/g
:a
   s/²[^³]*³//g
   t a
   s/.//p
   }'| sed -n 'H
$ {g
   s/<AttributeAuthorityDescriptor/²/g;s/<\/AttributeAuthorityDescriptor>/³/g
:a
   s/²[^³]*³//g
   t a
   s/.//p
   }'| grep -Ev 'bindings:HTTP-POST-SimpleSign|bindings:SOAP|SingleLogoutService Binding="ur
n:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect|urn:mace:shibboleth:1.0:profiles:AuthnReque
st|^$|^\s*$' > $2
