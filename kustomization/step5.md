En Kustomize, **commonLabels** y **commonAnnotations** son opciones que permiten agregar o actualizar etiquetas (labels) y anotaciones (annotations), respectivamente, en todos los objetos definidos en tus recursos de Kubernetes.

Editaremos nuevamente el archivo **kustomization.yaml** dentro del directorio *kustomization/overlay/dev*, agregandolo debajo de *secretGenerator*

<pre class="file" data-target="clipboard">
commonLabels:
  service: http
  environment: dev

commonAnnotations:
  note: "Esto es un ejemplo de de annotations"
</pre>

Los labels nos van a permitir poder filtrar, agrupar y facilitar la manipulación de los servicios ya desplegados en el cluster.

Las Annotations de igual manera se declaran como KEY:VALUE pero en este caso solo nos permite generar una mayor descripción de nuestro servicio.

Para previsualizar los cambios volvemos a ejecutar,

`kustomize build kustomization/overlays/dev/`{{exec}}

