La seguridad se refuerza a través de potentes características como la autenticación, autorización y cifrado del tráfico. Proporciona una capa de control de acceso y visibilidad que permite aplicar políticas de seguridad robustas en una malla de servicios, garantizando la confidencialidad y la integridad de las comunicaciones entre los servicios.


- Authorization policy

 Define políticas de autorización para el control de acceso. Permite especificar reglas granulares para determinar qué servicios pueden comunicarse entre sí y qué acciones están permitidas. Se pueden aplicar políticas basadas en roles y condiciones, garantizando un control detallado sobre las interacciones entre servicios dentro de la malla de servicios Istio.

Primero vamos a crear un despliegue en otro namespace

`kubectl label namespace test istio.io/rev=1-20-1`{{exec}}

`kubectl apply -f /root/istio-${ISTIO_VERSION}/manifests/profiles/demo/deploy_v3.yaml`{{exec}}

 Vamos a crear una policy que deniegue los request desde el namespace test hacia el namespace default

 `kubectl apply -f /root/istio-${ISTIO_VERSION}/manifests/profiles/demo/auth-policy.yaml`{{exec}}

 Para validarlo nos vamos a conectar al pod del service-v3,

```
kubectl exec -it "pod-id" -n test -- bash
```
Y vamos realizar un curl hacia el service-v1, donde veremos que la consulta es denegada

 `curl -v helloworld-v2.default:5000/hello`{{exec}}
