Podemos ver una previsualizacion de como var a quedar los recursos previo a aplicarlo:

`kustomize build overlay`{{exec}}

En caso de salga un error con el comando, esperar unos segundos y volver a intentar. Debido a que el ambiente puede estar terminando de instalar el binario de kustomize

Si todo este correcto podemos aplicarlo con el siguiente comando:


`kubectl apply -k overlay`{{exec}}