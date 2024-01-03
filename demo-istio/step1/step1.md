La instalación se simplifica gracias a istioctl. Este comando permite instalar, configurar y operar Istio de manera eficiente, proporcionando capacidades avanzadas como el enrutamiento de tráfico, la seguridad y el monitoreo. A través de istioctl, es posible personalizar la implementación y aplicar configuraciones específicas, adaptando la malla de servicios a las necesidades de las aplicaciones distribuidas. 

Con el siguiente comando se va  realizar la instaciob de los componentes necesario de Istio:

```
istioctl install --set profile=demo --revision 1-20-1
```

Es importante setear una revision ya que nos da flexibilidad para realizar parches y actualizaciones. Nos permite que diferentes version coexisten en el cluster y actualizar los microservicios de manera escalonada.

- Istiod

Es el componente central, encargado del plano de control de la malla de servicios. Responsable de la distribución y gestión de la configuración, políticas de red y seguridad.

- Envoy Proxy

Facilita la comunicación entre servicios distribuidos, ofreciendo funciones como el enrutamiento de tráfico, el equilibrio de carga, la gestión de conexiones y la observabilidad.

- Ingress Gateway

Funciona como un punto de entrada para las solicitudes HTTP y, opcionalmente, puede proporcionar funciones como el enrutamiento, la terminación SSL y la carga equilibrada. El Ingress Gateway facilita el acceso a los servicios internos desde fuera del clúster.

- Egress Gateway

Actúa como la puerta de enlace para las comunicaciones hacia servicios o recursos fuera de la malla, permitiendo aplicar políticas de seguridad, observabilidad y enrutamiento específicas.