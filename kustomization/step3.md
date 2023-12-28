
Cuando trabajas con Kustomize y ConfigMaps en Kubernetes, puedes aprovechar la funcionalidad de **configMapGenerator** para generar ConfigMaps de manera dinámica. Esto es especialmente útil para externalizar la configuración de tus aplicaciones y gestionarla de forma más eficiente.

Editaremos nuevamente el archivo **kustomization.yaml** dentro del directorio *kustomization/overlay/dev*, agregandolo debajo de *images*

<pre class="file" data-target="clipboard">
configMapGenerator:
  - name: app-config-nginx-example
    files:
      - properties.env
</pre>


- **files:** esta sección nos indica que vamos a generar un configMaps desde un archivo. En este caso tendremos un archivo llamado **properties.env** con un formato **key=value** 


Para previsualizar los cambios volvemos a ejecutar,

`kustomize build kustomization/overlays/dev`{{exec}}

Recordemos que no debemos exponer datos sensibles en archivos de propiedades ni que serán consumidos desde un configMaps. En el paso siguiente veremos como crear secrets para almacenar estos valores como datos sensibles.

