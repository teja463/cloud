# Running the demo application in local

- We have used kind cluster for below deployment
- Using traefik as the ingress controller. Install it via below commands, once you install this it will 
`
helm repo add traefik https://traefik.github.io/charts
helm upgrade --install -n traefik --create-namespace traefik traefik/traefik --version 20.8.0
`
- Verify the traefik controller is running by `kubectl get all -n traefik`
- The LoadBalancer service will not have any public IP assinged to it since we are using kind cluster
- Execute `cloud-provider-kind` in bash. If you don't have this then install it. After installation run the same command, it will assing a local IP to the load balancer public IP.
- Add an entry in the /etc/hosts file with the IP and hostname `172.18.0.6 kubernetes-course.devopsdirective.com`
- Create namespaces `postgres` and `demo-app`
- Execute the yml files in below order
    1. `mw.yml` custom middleware for traefik ingress to strip out the URL so that /api/hello can be redirected to /hello back-end
    1. `postgres.yml` creates postgress instance for our backend to connect to
    1. `api.yml`
    1. `api-route.yml`
    1. `ui.yml`
    1. `ui-route.yml`

- Now you have all your pods, services, ingressroute up and running browse [UI](http://kubernetes-course.devopsdirective.com/) [backend-api](http://kubernetes-course.devopsdirective.com/api/hello)
