# Helm

## Repos and Hub

- Main hub for helm is <https://artifacthub.io/>
- You can also add repos e.g `helm repo add bitnami https://repo.broadcom.com/bitnami-files`

## Searching Repo

- `helm search hub mysql` it will search in the artifacthub
- `helm search hub mysq --list-repo-url` to see the url of the helm chart
- `helm search repo mysql` it will search in the local repos

## Installing charts

- `helm install your-release-name chartname` e.g `helm install mynginx bitnami/nginx`
- `helm install bitnami/nginx --generate-name` let helm generate the release name
- `helm install mynginx bitnami/nginx --dry-run=client` to do a dry run of the installation
- `helm list` to see installed charts
- `helm uninstall mynginx` to uninstall the release

## Viewing Installed Chart Info

- `helm status mynginx` To see the status of the release
- `helm get manifest mynginx` to see the manifest file of all deployed resources
- `helm status --help` to see more options for the status command

## Customizing Helm Chart values

- `helm show values bitnami/nginx` to show all the values available to customize
- `helm install wp bitnami/wordpress --set wordpressUsername=test --set wordpressPassword=test` to customize the values
- `helm install wp bitnami/wordpress --set wordpressUsername=test,wordpressPassword=test` to set multiple values
- `helm install wp bitnami/wordpress --set-string wordpressUsername=1234` to set the values as strings
- `helm install wp bitnami/wordpress --set-file wordpressUsername=user.txt` to read the value from the file
- `helm install wp bitnami/wordpress --values values.yml` when you want to customize multiple values
- `helm get values wp` to see the values that are customized

## Upgrading installed Charts

- `helm install wp bitnami/wordpress --set wordpressBlogName=SampleBlog1` to do the installation
- `helm upgrade wp bitnami/wordpress --set wordpressBlogName=SampleBlog2` Upgrade the chart with new values
- `helm get values wp` to verify the customized values
- `helm history wp` to check the history of the helm release
- `helm rollback wp 1` rollback to revision 1

## Installing myappchart

- Created a sample chart based on the k8s myapp folder
- `helm install mapp ./myappchart` to install the helm chart
