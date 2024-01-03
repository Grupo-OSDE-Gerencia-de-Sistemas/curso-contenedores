FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}
export ISTIO_VERSION=1.20.1
curl -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> .bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
mv /root/demo /root/istio-${ISTIO_VERSION}/manifests/profiles/
kubectl create ns test
istioctl install --set profile=demo --revision 1-20-1 -y --manifests=/root/istio-${ISTIO_VERSION}/manifests