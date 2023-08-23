En este paso es necesario levantar un pod, con el siguiente comando:

`kubectl run nginx --image=nginx --port=80`{{exec}}

Para vefiricar estado del pod usar el siguiente comando para ver los pods existentes:

`kubectl get pods`{{exec}}

En caso que no haya pods corriendo tal vez el escenario esta cargando aun. Esperar unos segundos y listar los pods nuevamente. Puedes continuar una vez que se vea un pod en estado Running.

Ahora, para ver que contenedores estan corriendo dentro del Pod y que imagen se utilizo corremos el siguiente comando:

`kubectl describe pods`{{exec}}

Podemos ver detalles del contenedor como, imagen, labels, IP, puerto, y la lista de eventos relacionados con el Pod.
