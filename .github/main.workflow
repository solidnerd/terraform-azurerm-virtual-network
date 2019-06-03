workflow "Semantic Release" {
  on = "push"
  resolves = ["semantic-release"]
}

action "filter-master-branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "semantic-release" {
  needs = "filter-master-branch"
  uses = "docker://node:stretch"
  runs = "npx -p semantic-release -p @innovationnorway/semantic-release-terraform-config semantic-release"
  secrets = ["GH_TOKEN"]
}

workflow "Terraform" {
  on = "push"
  resolves = ["terraform-fmt"]
}

action "terraform-fmt" {
  uses = "docker://hashicorp/terraform:latest"
  args = "fmt -check -list -recursive"
}