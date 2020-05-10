---
layout: post
title: linters 
subtitle: linters for ansible and cloudformation 
tags: [ansible lint]
comments: true
---


## Ansible lint 
* link
```
https://docs.ansible.com/ansible-lint/
```

* install ansible lint
```
sudo pip install ansible-lint
```

* check available rules
```
ansible-lint  -T
```

* run the linter without relevant rules -
for example, exclude readbility and formatting rules : 
```
ansible-lint -x formatting,502 <playbook> / rules dir
```

## cloudformation lint
* link
```
https://github.com/aws-cloudformation/cfn-python-lint
```

* install
```
sudo pip install cfn-lint
```

* check available rules:
```
cfn-lint -l
```

* run the linter
```
cfn-lint -t <cloudformation template>
```


## Kubernetes lint
* link 
```
https://www.kubeval.com/
```

* installation  
```
https://www.kubeval.com/installation/
```

* run the linter
```
kubeval -v 1.6.6 my-deployment.yaml
kubeval --openshift -v 1.5.1 my-deployment.yaml

```
