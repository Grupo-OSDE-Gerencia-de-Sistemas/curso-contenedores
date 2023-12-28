
Los secrets en Kubernetes son una forma de almacenar y administrar información sensible, como contraseñas, tokens,etc. Ayudan a desacoplar esta información de las aplicaciones y a evitar su exposición innecesaria.

**SecretGenerator**  se usa para generar recursos Secret de manera declarativa. En lugar de crear manualmente un  Secret y luego hacer referencia a él en tu configuración, puedes usar SecretGenerator para crear un Secret directamente desde un archivo de configuración de Kustomize.


Editaremos nuevamente el archivo **kustomization.yaml** dentro del directorio *kustomization/overlay/dev*, agregandolo debajo de *configMapGenerator*

<pre class="file" data-target="clipboard">
secretGenerator:
- envs:
  - .env.secret
  name: secrets-nginx-example
</pre>

- **envs:** Nos permite generar secretos desde archivos ocultos como son los .env

Además de generar un manifiesto de tipo secreto los datos que integran este archivo son encriptados en **base64** una vez que se ejecuta.

Para objeto del curso ya tenemos un archivo .env.secret en un formato **key=value**

Para previsualizar los cambios volvemos a ejecutar,

`kustomize build kustomization/overlays/dev`{{exec}}

Dentro de las mejores prácticas para el manejo de secretos debemos usar una bóveda de llaves para almacenar dichos datos, ya que no deben estar expuestos en nuestros repositorios.
