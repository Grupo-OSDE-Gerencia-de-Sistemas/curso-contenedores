La inyección de Envoy Proxy en Istio con labels, el proceso implica etiquetar el namespace con la revisión objetivo y luego desplegar aplicaciones en ese namespace. Esto garantiza que Envoy Proxy se inyecte automáticamente con la configuración asociada a la revisión indicada. Este enfoque proporciona flexibilidad para gestionar múltiples revisiones de Istio en distintas partes de la malla de servicios.

Vamos a setear el label con la version 1.20.1 con el siguiente comando:

`kubectl label namespace default istio.io/rev=1-20-1`{{exec}}

Ahora vamos a realizar un despliegue de un microservio

`kubectl apply -f /root/istio-${ISTIO_VERSION}/manifests/profiles/demo/deploy_v1.yaml`{{exec}}

Si consultamos el pod desplegado veremos 2 contenedores

`kubectl describe pod`{{exec}}

Podremos observar un contenedor llamado istio-proxy. Actúa como el sidecar, gestionando la comunicación de red entre servicios. Facilita funciones clave como el enrutamiento, balanceo de carga, seguridad y observabilidad.