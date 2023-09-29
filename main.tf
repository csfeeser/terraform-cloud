terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "null" {
  # Configuration options
}

/* a list of local variables */
locals {
  jones = ["indy", "henry", "marian"]
}


/* The null_resource implements the standard resource lifecycle but takes no more action */
resource "null_resource" "jones" {
  for_each = toset(local.jones)
  /* triggers allows specifying a random set of values that when
     changed will cause the resource to be replaced */
  triggers = {
    name = each.value  // a special variable, "each" created by terraform
                       // the object has "each.key" and "each.value"
  }
}

/* We want these outputs */
output "jones" {
  value = null_resource.jones
}
