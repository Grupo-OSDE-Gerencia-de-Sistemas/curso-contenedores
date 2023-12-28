El uso de Kustomize favorece un enfoque donde se mantienen las configuraciones base en una carpeta y las personalizaciones para cada entorno se mantienen en carpetas separadas.

- **base:** En este directorio, colocas tus archivos YAML base que son compartidos entre todos los entornos. Pueden incluir recursos como deployment, services, secret, configmaps, etc.
- **overlay:** Aqui es donde creas subdirectorios para cada entorno especifico (por ejemplo, desarrollo, produccion). Cada subdirectorio contiene un archivo **kustomization.yaml** para ese entorno y cualquier parche especifico necesario.

Se puede visualizar en el siguiente ejemplo:
```
├── base
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── overlays
│   ├── dev
│   │   ├── replica_count.yaml
│   │   └── kustomization.yaml
│   ├── staging
│   │   ├── replica_count.yaml
│   │   └── kustomization.yaml
│   └── prod
│       ├── replica_count.yaml
│       └── kustomization.yaml
```

Podemos ejecutar el comando **tree** donde podremos vizualizar un ejemplo con una estructura ya creada.

`tree kustomization/`{{exec}}

En caso de salga un error con el comando, esperar unos segundos y volver a intentar. Debido a que el ambiente puede estar terminando de instalar los binarios necesarios.
