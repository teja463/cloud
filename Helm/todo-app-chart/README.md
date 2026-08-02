# Running the Todo App in local

- We have used kind cluster for the deployment
- Using traefik as the ingress controller. Install it via below commands, once you install this it will 
`
helm repo add traefik https://traefik.github.io/charts
helm upgrade --install -n traefik --create-namespace traefik traefik/traefik --version 20.8.0
- The LoadBalancer service will not have any public IP assinged to it since we are using kind cluster
- Execute `cloud-provider-kind` in bash. If you don't have this then install it. After installation run the same command, it will assing a local IP to the load balancer public IP.
- Add an entry in the /etc/hosts file with the External IP of the traefik controller and hostname as below. To find the External IP execute `kubectl get svc -n traefik`
    - `172.18.0.6 todoapp.com`
- Browse [UI](http://todoapp.com/) [backend-api](http://todoapp.com/api/todo)
