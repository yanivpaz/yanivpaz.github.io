# CB 6.5.1  with operator v2 on WSL 

## Links
https://blog.couchbase.com/couchbase-autonomous-operator-2-0-for-kubernetes-is-now-ga/
https://docs.couchbase.com/operator/2.0/install-kubernetes.html


download the couchbase-autonomous package after short registration from https://www.couchbase.com/downloads
https://packages.couchbase.com/kubernetes/2.0.0/couchbase-autonomous-operator-kubernetes_2.0.0-linux-x86_64.tar.gz

```
export CBVER=2.0.0
tar zxvf couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64.tar.gz
rm -f couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64.tar.gz
mkdir ~/cb-aok2
cd !$
~/couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64/bin/cbopcfg -file
```
