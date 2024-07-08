This repository contains code for deploying a microservice namely, whereami to a GKE private cluster using Terraform.

*****Deploy the infra using terraform****
In order to deploy it, we need to deploy the GCS bucket first in order to create a remote state backend. 
To authenticate, run gcloud auth login using the command line utility 
Go to the terraform/global/gcs folder, make the relevant changes to the terraform.tfvars file and then run
$ terraform init 
$ terraform plan
$ terraform apply
This creates your GCS bucket. 

We then create a VPC and subnet using the code in terraform/global/networking/vpc_subnets folder, and then make suitable changes to the terraform.tfvars, and run
$ terraform init 
$ terraform plan
$ terraform apply

This will create a custom VPC along with 1 subnet for GKE purposes. 

Navigate to terraform/global/iam/service-accounts folder, change the values in terraform.tfvars and run 

$ terraform init 
$ terraform plan
$ terraform apply

This will create a custom service account that we can use for Kubernetes. 

We also need to attach IAM bindings to the service account, for this we can go to terraform/global/iam/iam-bindings, make appropriate changes to terraform.tfvars, and run 

$ terraform init 
$ terraform plan
$ terraform apply

This will attach the IAM bindings required for Kubernetes to the service account created above.

Finally, we create the Kubernetes cluster. To do so, we can go to terraform/region/gke_cluster, and change values in terraform.tfvars and run 

$ terraform init 
$ terraform plan
$ terraform apply

This should ideally create the GKE cluster along with 1 node pool. 

**********Deploying application using Helm******

For deploying the whereami microservice using Helm, you can navigate to the whereami-chart, and make changes in the values.yaml file as you see fit. We then run 
$ helm package . 
to package the chart 

We shall need to authenticate ourselves with the cluster and for that we should go to the GKE cluster page, click on the cluster, and click on connect. This will provide us with the command
to authenticate ourselves with the cluster.

Once done, 
we can deploy the chart using:

$ helm install whereami whereami-0.1.0.tgz --set ingress.enabled=true

Reserve a static IP by creating one using the Google Cloud console.

# To proceed, you should own your domain and ensure that the relevant records are updated in the domain registrar.
Once the chart is deployed, make the changes in the managedcertificate.yaml file to use the domain that you own and apply it using the following command:

$kubectl apply -f managedcertificate.yaml 

Also change ingress.yaml file to add the following annotations:

kubernetes.io/ingress.global-static-ip-name: <reserved-static-ip>
networking.gke.io/managed-certificates: <name-of-managed-cert>
kubernetes.io/ingress.class: "gce"

and apply the ingress file to the kubernetes cluster
$ kubectl apply -f ingress.yaml

This should create the Google managed certificate and create an ingress resource that will route traffic to the application created using the Helm Chart.
optional: we can create a FrontEnd redirect to redirect requests coming on port 80 to port 443.

********Create firewall rules using Python*****
There is a folder under terraform/global/networking called firewall_rules, and this folder contains a python script called create_firewall_rules.py. This script will be called 
an external data block called 'create_firewall_rules'. In order to execute this, visit the firewall_rules folder, and change the values in terraform.tfvars to the ones you want
Then run a terraform init, followed by a terraform plan. Finally, run a terraform apply in order to apply the firewall rules to the VPC network.
There are 2 firewall rules being created here:
"allow-egress-to-gke-master" - Allows egress traffic from nodes to GKE master node

allow-internal-communication" - Allows ALL communication between nodes and pods. 






