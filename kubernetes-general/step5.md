Con el HPA es posible delegar a Kubernetes el manejo de la cantidad de pods que usa deployment segun la utilizacion de los recursos.

Volvemos a abrir la pestaña  **Editor**  y crearemos un archivo **hpa.yaml** con el contenido a continuacion.

<pre class="file" data-target="clipboard">
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: kubernetes-bootcamp-autoscaler
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: kubernetes-bootcamp
  minReplicas: 2
  maxReplicas: 3
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
</pre>

Volvemos a la linea de comando y  aplicaremos el hpa

`kubectl apply -f hpa.yaml`{{execute}}

Luego de unos segundos veremos como nuestro deployment disminuye la cantidad de pods:
 
`kubectl get deployments`{{execute}}

