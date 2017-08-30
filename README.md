OULibraries.CAS
=========

[CAS](https://apereo.github.io/cas/4.2.x/index.html) for OU Libraries.

Currently focused on [LDAP integration](https://apereo.github.io/cas/4.2.x/installation/LDAP-Authentication.html).

Requirements
------------

CentOS 7.x.

Role Variables
--------------
You can optionally authenticate against a simple filestore with username::password combinations. Stores credentials in the clear. Don't use in production.

```
cas_fileauth_users:
  - username: username
    password: userpassword
```

You can optionally configure CAS to build with a custom overlay based
on [overlay template](https://github.com/apereo/cas-overlay-template)
from Apereo by specifying a git repository for the template and the
version to use.

```
cas_overlay_repo: 
cas_overlay_version: 
```

You can optionally enable a [SAML2 Identity Provider](https://apereo.github.io/cas/5.0.x/installation/Configuring-SAML2-Authentication.html) service in cas.
To do so, set:
```
cas_saml2_idp: true
cas_samlIdp_hostName: cas.example.com
cas_samlIdp_scope: example.com
```



You can optionally authenticate against multiple ldap systems.  This role currently supports authenticated search only.

```
cas_ldap:
    # URI for this LDAP endpoint
  - url: 'ldap://ldap.example.com'
    # Type of system:
    # AD|AUTHENTICATED|DIRECT|ANONYMOUS|SASL
    type: 'AD'
    # Start TLS for SSL connections
    useSsl: 'true'
    useStartTLS: 'false'
    # LDAP connection timeout in milliseconds
    connectTimeout: '5000'
    # Setting to true allows cas to start without this ldap provider
    failFast: 'true'
    # Base DN of users to be authenticated
    baseDn: 'OU=Users,DC=domain,DC=example,DC=com'
    # DN format for users to be authenticated
    dnFormat: '%s@example.com'
    # The filter is used to search for the user account
    # https://access.redhat.com/documentation/en-US/Red_Hat_Directory_Server/8.2/html/Administration_Guide/Finding_Directory_Entries-LDAP_Search_Filters.html
    userFilter: 'sAMAccountName={user}'
    # Recursively search the Base DN?
    subtreeSearch: 'true'
    # The attribute that represents the username
    principalAttributeId: 'sAMAccountName'
    # The attribute that represents the password
    principalAttributePassword: 'unicodePwd'
    # A list of principal attributes
    principalAttributeList: 'sn,cn,givenName,sAMAccountName'
    # Modifies principal attributes returned by CAS
    # NONE|UPPERCASE|LOWERCASE
    principalTransformation_caseConversion: 'NONE'
    # Allows multiple values per attribute
    allowMultiplePrincipalAttributeValues: 'true'
    # The junk drawer of user attributes
    additionalAttributes: 'memberOf'
    # Bind account DN
    bindDn: 'CN=ServiceAccount,OU=SomeNonStandardOU,DC=domain,DC=example,DC=com'
    # Bind account password
    bindCredential: 'AStrongPassphraseofSomeSort'
    # LDAP connection pool configuration
    pool_minSize: '0'
    pool_maxSize: '10'
    pool_validateOnCheckout: 'true'
    pool_validatePeriodically: 'true'
    pool_validatePeriod: '600'
```

You can optionally configure CAS to act as a client against a SAML ID provider. Learn about CAS and SAML to discover how to configure these values.

```
cas_pac4j_saml:
  storepass:
  keypass:
  dname:
  idp_md_url:
  entityId:
  logoutLocation:
  consumerLocation:
  orgName:
  orgDisplayname:
  orgURL:
```

See defaults/main.yml for the rest

Dependencies
------------

OULibraries.centos7
OULibraries.users

Example Playbook
----------------

```
- hosts: servers
  become: true
  vars_files:
    - my-vars.yml
  roles:
    - OULibraries.centos7
    - OULibraries.cas
    - OULibraries.users
```

License
-------

[MIT](https://github.com/OULibraries/ansible-role-cas/blob/master/LICENSE)

Author Information
------------------

Jason Sherman
