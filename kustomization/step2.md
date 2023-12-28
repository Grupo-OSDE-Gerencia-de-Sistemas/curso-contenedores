
Es posbible cambiar imágenes en Kustomize a través del archivo kustomization.yaml, utilizando el campo **images**.

En la parte superior veremos una pestaña **Editor** donde podremos visualizar las carpetas base y overlay. Dentro de *kustomization/overlay/dev* crearemos el archivo **kustomization.yaml** con el siguiente contenido,

<pre class="file" data-target="clipboard">
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: test

resources:
- ../../base

images:
  - name: IMAGE_TAG
    newName: ubuntu
    newTag: mantic-20231011
</pre>

- **resources:** Aquí sé específica el directorio base donde están nuestros manifiestos de los recursos a crear.
- **images:** Aquí pondremos el nombre de nuestra imagen y el tag correspondiente al ambiente.

Una vez guardado los cambios en el archivo, es posible ejecutar una previsualización, mediante el comando kustomize build, para ver los cambios sin aplicarlos.

`kustomize build kustomization/overlays/dev`{{exec}}

