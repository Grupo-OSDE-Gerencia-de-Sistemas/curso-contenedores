Es posible exponer nuestro deployment mendiante un service con el siguiente comando:

`kubectl expose deployments/kubernetes-bootcamp --type="NodePort" --port 8080`{{execute}}

Podemos ver como el Service hace el balanceo del trafico. Para ver la IP expuesta y el puerto que usa usamos el comando describe como en los pasos previos:

`kubectl describe services/kubernetes-bootcamp`{{execute}}

Verificar el campo NodePort para veficar el puerto.

Con el comando `get nodes` veremos la ip del nodo del cluster para consultar nuestra aplicacion:

`kubectl get nodes -o wide`{{execute}}


Ahora vamos a ejecutar un `curl` con la IP expuesta y el puerto. Ejecutar el comando varias veces:

`curl <ip_node>:<NodePort>`{{execute}}

Con cada request consultamos un Pod distinto. Esto muestra que el balanceo funciona.