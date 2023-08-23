Todo lo que la aplicacion normalmente enviaria a `STDOUT` se convierten en logs del contenedor dentro del pod
Podemos ver esos logs usando el siguiente comando especificado en el nombre del pod:

`kubectl logs <pod name>`{{exec}}

*Nota: En este caso no es necesario especificar el nombre del contenedor, porque solo tenemos 1 dentro del pod.*

En caso de querer ver un contenedor se debe agregar el flag " -c <container_name>" para visualizar los logs.