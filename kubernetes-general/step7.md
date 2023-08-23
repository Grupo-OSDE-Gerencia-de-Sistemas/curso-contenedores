Dentro de las buenas practicas es necesario definir los recursos (memoria y cpu) que van a requerir nuestros contenedores


- **Request:** definicion de la cantidad minima para ser utilizada por el contenedor.
- **Limit:** definicion de la cantidad maxima que puede ser utilizada por el contenedor.


EN la a pestaña  **Editor**  y editaremos el **deployment.yaml** y agregaremos los resources (limit y request) luego del campo **resources** dentro del spec del template.

<pre class="file" data-target="clipboard">
    template:
      metadata:
        creationTimestamp: null
        labels:
          app: kubernetes-bootcamp
      spec:
        containers:
        - image: gcr.io/google-samples/kubernetes-bootcamp:v1
          imagePullPolicy: IfNotPresent
          name: kubernetes-bootcamp
          ports:
          - containerPort: 8080
            protocol: TCP
          resources:
            limits:
              cpu: 20m
              memory: 100Mi
            requests:
              cpu: 10m
              memory: 50Mi
</pre>

Volvemos a la linea de comando y  aplicaremos la modificaciones

`kubectl apply -f deployment.yaml`{{execute}}

Para verificar que se hayan aplicados los cambio usaremos el describe:
 
`kubectl describe deployment kubernetes-bootcamp`{{execute}}

