En este escenario vamos a encontrar dos carpetas:

- **base:** aqui vamos a encontrar los archivos yaml con un template de un deployment, un service y con archivo kustomization con los recursos.
- **overlay:** aqui vamos a encontrar un archivo kustomization con el cual vamos a poder personalizar los templates de la carpeta base



Run `kubectl get pod -A`{{exec}}
