En este escenario vamos a encontrar dos carpetas:

- **base:** aqui vamos a encontrar los archivos yaml con un template de un deployment, un service, un hpa y con archivo kustomization con los recursos.
- **overlay:** aqui vamos a encontrar un archivo kustomization con el cual vamos a poder personalizar los templates de la carpeta base.

La ventaja que podemos encontrar es que podemos tener un template dentro de la carpeta base y valores que se ejecuten por ambiente con las carpetas overlay.

Ejemplo:

```
├── base
  │   ├── deployment.yaml
  │   ├── hpa.yaml
  │   ├── kustomization.yaml
  │   └── service.yaml
  └── overlays
      ├── dev
      │   ├── hpa.yaml
      │   └── kustomization.yaml
      ├── production
      │   ├── hpa.yaml
      │   ├── kustomization.yaml
      │   ├── rollout-replica.yaml
      │   └── service-loadbalancer.yaml
      └── staging
          ├── hpa.yaml
          ├── kustomization.yaml
          └── service-nodeport.yaml
```