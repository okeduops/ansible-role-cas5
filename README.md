OULibraries.CAS
=========

[CAS](https://apereo.github.io/cas/4.2.x/index.html) for OU Libraries.

Currently focused on [LDAP integration](https://apereo.github.io/cas/4.2.x/installation/LDAP-Authentication.html).

Requirements
------------

CentOS 7.x.

Role Variables
--------------

See defaults/main.yml

Dependencies
------------

OULibraries.centos7
OULibraries.users

Example Playbook
----------------

```
- hosts: servers
  sudo: yes
  vars_files:
    - my-vars.yml
  roles:
    - OULibraries.centos7
    - OULibraries.cas
    - OULibraries.users
```

License
-------

TBD

Author Information
------------------

Jason Sherman
