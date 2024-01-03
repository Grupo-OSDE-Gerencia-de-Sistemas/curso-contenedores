- Gateway

puerta de entrada que permite que el tráfico externo ingrese a la malla de servicios. Define cómo se deben exponer los servicios en la malla y gestiona las solicitudes provenientes del exterior. Especifica detalles como puertos, protocolos y certificados SSL, proporcionando una interfaz para el enrutamiento y las políticas de red. Se utiliza en conjunto con el VirtualService para definir reglas de enrutamiento y políticas de red.

Vamos a crear un gateway con el siguiente manifiesto de prueba

`kubectl apply -f /root/istio-${ISTIO_VERSION}/manifests/profiles/demo/gateway.yaml`{{exec}}

- VirtualServices

define reglas de enrutamiento y políticas para el tráfico entre servicios. Actúa como un componente clave para personalizar cómo se gestionan las solicitudes dentro de la malla de servicios, permitiendo configuraciones como el enrutamiento basado en URL, el balanceo de carga y la aplicación de políticas de tráfico avanzadas.

Antes de crear nuestro VirtualService vamos a desplegar otro despliegue,

`kubectl apply -f /root/istio-${ISTIO_VERSION}/manifests/profiles/demo/deploy_v2.yaml`{{exec}}


Vamos a crear un VirtualService que balancee la carga entre nuestros 2 servicios,

`kubectl apply -f /root/istio-${ISTIO_VERSION}/manifests/profiles/demo/virtual_service.yaml`{{exec}}

Para consultar nuestro servicio vamos a realizar un port-forward,

```plain
kubectl port-forward -n istio-system --address 0.0.0.0 service/istio-ingressgateway 1234:80
```{{exec}}

Ahora podemos [ACCEDER]({{TRAFFIC_HOST1_1234}}/hello) al aplicativo y veremos como se realiza el balanceo entre los 2 servicios

