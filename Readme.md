# Helm lab deployment

I have a Kubernetes lab, running on Proxmox. I can spin it up in a few minutes (worker nodes, longhorn storage nodes, ...). All automated with Terraform for the creation of the VMs, and Ansible for the creation of the K3s config. 

I wanted to have an automated deployment of all the applications that I either use regularly, or that I test, or that my customers may want to test. 

So I built a simple set of modules that can be automatically deployed (at the time of writing this, the apps are deployed and configured in about 6 minutes)

## What's in it ?

The following apps are deployed :

- Kubernetes dashboard (without any password, that's just my lab install, don't do it in production !)
- Kubeapps (for the odd days where I want to do a GUI-based deployment. )
- Argo CD
- Prometheus and Grafana
- ELK and Kibana
- Longhorn (to provide the storage to my pods)
- Keycloak

## Todo

- Istio
- A better integration with Minio
- Velero
- Cert-manager
- 

## How to use this ?

Fairly simple. Clone the repo, create the terraform.tfvars in all necessary modules (hint: if there's a vars.tf in the module, you need the equivalent terraform.tfvars). Terraform init, plan, apply, ... and off you go ! 

The name for the admin user in each of the applications is "admin", and the password is defined in the tfvars files. 
