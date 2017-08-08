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



You can optionally authenticate against multiple ldap systems.  This role currently supports authenticated search only.

```
cas_ldap:
    # LDAP General
  - url: ""
    use_ssl: "false"
    useStartTLS: "true"
    rootDn: ""
    baseDn: ""
    managerDn: ""
    managerPassword: ""
    domain: ""
    connectTimeout: 3000
    # LDAP connection pool
    pool_minSize: 1
    pool_maxSize: 10
    pool_validateOnCheckout: "false"
    pool_validatePeriodically: "true"
    pool_blockWaitTime: 3000
    pool_validatePeriod: 300
    pool_prunePeriod: 300
    pool_idleTime: 600
    # LDAP authentication
    authn_searchFilter: "sAMAccountName={user}"
    userFilter: ""
    usePpolicy: "false"
    allowMultipleDns: "true"
    failFastInitialize: "true"
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
