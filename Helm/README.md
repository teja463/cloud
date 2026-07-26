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

## Publishing the chart

- First package the chart `helm package ./myappchart` it will create the `.tgz` file of the chart
- `helm registry login registry-1.docker.io -u your-user-id`. We are using docker to publish our helm chart
- Create a Personal Access token in docker and use that as password for the next step
- `helm push myappchart-1.0.0.tgz oci://registry-1.docker.io/teja463`, now the chart is published to `registry-1.docker.io/teja463/myappchart:1.0.0`
- To install the published chart use `helm install myapp-docker oci://registry-1.docker.io/teja463/myappchart:1.0.0`
- To install the chart from local tgz file `helm install mapp ./myappchart-1.0.0.tgz`

## MyChart versions

|Version|Description|Chart Location
|---|---|---|
|1.0.0|Uses the image tags 1.0.0 which has only one end point /hello, it just displays the no of records in db|oci://registry-1.docker.io/teja463/myappchart:1.0.0|
|2.0.0|Has the todo app along with hello app|oci://registry-1.docker.io/teja463/myappchart:2.0.0|
