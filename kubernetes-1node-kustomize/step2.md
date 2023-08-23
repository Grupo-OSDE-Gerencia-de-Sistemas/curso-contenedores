dentro de la carpeta overlay, en kustomization.yaml veremos el siguente contenido:

<pre class="file" data-target="clipboard">
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: default

resources:
- ../base

images:
- name: IMAGE_TAG
  newName: gcr.io/google-samples/kubernetes-bootcamp
  newTag: v1

patchesStrategicMerge:
- hpa.yaml

configMapGenerator:
  - name: lab-props
    env: app.properties

secretGenerator:
  - name: lab-secret
    type: Opaque
    envs:
      - .secrets
</pre>

con los templates dentro de la carpeta base al ejecutar el kustomize se crearan un deployment, un service y patchear un hpa.

De la misma manera utilizando el configMapGenerator y SecretGenerator kustomize nos permite crear ConfigMap y Secrets.

