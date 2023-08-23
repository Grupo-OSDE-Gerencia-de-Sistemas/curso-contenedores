Con vimos en el caso anterior, tambien es importante definir health checks que controlen cuando nuestra aplicacion esta lista para recibir consultas.


- **ReadinessProbe:**
- **Liveness Probe:**

VEn la pestaña  **Editor**  y crearemos un archivo **deploy_health_check.yaml** con el contenido a continuacion.

<pre class="file" data-target="clipboard">

</pre>

Volvemos a la linea de comando y  aplicaremos el hpa

`kubectl apply -f deploy_health_check.yaml`{{execute}}

Luego de unos segundos veremos como nuestro deployment disminuye la cantidad de pods:
 
`kubectl get deployments <name_deploy>`{{execute}}

Luego de unos segundos veremos como nuestro deployment disminuye la cantidad de pods:
 
`kubectl describe <name_deploy>`{{execute}}

