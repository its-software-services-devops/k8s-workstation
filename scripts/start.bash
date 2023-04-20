#!/bin/bash

TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
KCFG_FILE=/home/${SSH_USER}/kubeconfig
PROF_FILE=/home/${SSH_USER}/.profile

echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd

cat <<END > "${KCFG_FILE}"
apiVersion: v1
kind: Config
preferences: {}
current-context: default-context
clusters:
- cluster:
    insecure-skip-tls-verify: true
    server: https://kubernetes.default.svc.cluster.local
  name: local-cluster
contexts:
- context:
    cluster: local-cluster
    user: support
  name: default-context
users:
- name: support
  user:
    token: ${TOKEN}
END

chown ${SSH_USER} ${KCFG_FILE}
chmod 600 ${KCFG_FILE}
echo "export KUBECONFIG=${KCFG_FILE}" >> ${PROF_FILE}

/usr/bin/supervisord -c "/etc/supervisor/conf.d/supervisord.conf"
