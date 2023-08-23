Ahora vamos a crear un deployment con el siguiente comando:

`kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080`{{execute}}

Para listar los deployment usamos el comando `get deployments`:
`kubectl get deployments`{{execute}}

El output deberia ser similar a esto:
```
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
kubernetes-bootcamp   1/1     1            1           11m
```

Deberia haber 1 Pod. Si no, ejecutar nuevamente. Este muestra:
- *NAME* Lista de los deployment en el namespace actual.
- *READY* muestra la replicas en estado CURRENT/DESIRED.
- *UP-TO-DATE* despliega el numero de replicas que han sido actualizadas para alcanzar es estado deseado.
- *AVAILABLE* muestra el numero de replicas disponibles.
- *AGE* muestra el tiempo que ha estado corriendo.

Para ver el ReplicaSet creado por el deployment, ejecutar:
`kubectl get rs`{{execute}}

Se puede ver que el nombre del  ReplicaSet siempre esta formateado como `[DEPLOYMENT-NAME]-[RANDOM-STRING]`. Este string es generado por Kubernetes y va a ser usado como prefijo en los pods.

Este muestra:
- *DESIRED* muestra el numero deseado de replicas, anteriormente denifinidas en el deployment.
- *CURRENT* muestra el numero de replicas actualmente corriendo.

Es posible aumentar el numero de replicas seguido por el deployment, nombre y el numero de replicas:

En caso de querer aumentar la cantidad de replicas es posible editando el deployment. Para ello vamos a exportar el manifiesto en formato yaml con el comando `kubectl get`:

`kubectl get deployment kubernetes-bootcamp -o yaml > deployment.yaml`{{execute}}

En parte superior veremos una pestaña  **Editor** donde podremos vizualizar el .yaml. Abriremos el archivo y editaremos el campo **replicas** a 4 y borraremos la linea **resourceVersion**. Finalmente volvemos a la linea de comando y  aplicaremos los cambios

`kubectl apply -f deployment.yaml`{{execute}}

Para chequear utilizamos nuevamente el deploy con el comando `get deployments`:

`kubectl get deployments`{{execute}}

De la misma manera podemos ver como la cantidad de pod aumentó:

`kubectl get pods -o wide`{{execute}}

El cambio quedo registrado en los eventos del Deployment. Para chequearlo usamod el comando describe:

`kubectl describe deployments/kubernetes-bootcamp`{{execute}}