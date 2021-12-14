export DOMAIN="trinity-healthware.com" && \
cat << EOF | tee ingress/proxy.yaml
apiVersion: projectcontour.io/v1
kind: HTTPProxy
metadata:
  name: podinfo
  namespace: projectcontour
  annotations:
    fluxcd.io/ignore: "false"
spec:
  virtualhost:
    fqdn: podinfo.${DOMAIN}
    tls:
      secretName: cert
  includes:
    - name: podinfo
      namespace: demo
EOF
