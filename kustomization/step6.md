La función **patches** en Kustomize permite especificar una o varias modificaciones para aplicar a los recursos definidos en el directorio **base**. Esto es muy útil para el manejo de ambientes y sus diferentes parámetros.

La función patches fue introducida en Kustomize 3.1.0, en versiones anteriores existian **patchesStrategicMerge** o **patchesJson6902** aun es muy comun ver estas funciones.

Editaremos nuevamente el archivo kustomization.yaml dentro del directorio kustomization/overlay/dev, agregandolo dejabo de **commonAnnotations**

<pre class="file" data-target="clipboard">
patches:
- path: deployment.yaml
  target:
    kind: Deployment
    name: nginx-example

- path: hpa.yaml
  target:
    kind: HorizontalPodAutoscaler
    name: nginx-example-hpa
</pre>

- **target:** nos permite poder especificar cuál es el recurso que vamos a impactar con el cambio. El nombre del recurso debe ser igual al objeto de la carpeta base para que pueda impactar la modificación.

Para previsualizar los cambios volvemos a ejecutar,

`kustomize build kustomization/overlays/dev`{{exec}}

En este punto podemos aplicar los cambios que generamos con kustomize en el cluster con el siguiente comando. `kubectl apply -k kustomization/overlays/dev`{{exec}}

kubectl utiliza Kustomize como una biblioteca. Esto significa que kubectl apply -k usa la versión de Kustomize que está empaquetada con kubectl, que podría no ser la última versión de Kustomize.
