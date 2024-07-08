package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestTerraformBasicExample(t *testing.T) {
    t.Parallel()

    // Define the options for Terraform
    terragruntOptions := &terraform.Options{
        // Path to the Terraform code to be tested
        TerraformDir: "../global/networking/vpc_subnets",  // Adjust the path according to your repo structure

        // Variables to pass to our Terraform code using -var options
        Vars: map[string]interface{}{
            "project_id": "burner-jerferre", // Add necessary variables
        },

        // Variables to pass to our Terraform code using -var-file options
        VarFiles: []string{"../global/networking/vpc_subnets/terraform.tfvars"},
    }

    // Run `terragrunt apply` and fail the test if there are any errors
    defer terraform.Destroy(t, terragruntOptions)
    terraform.InitAndApply(t, terragruntOptions)

    // Validate your code
    output := terraform.Output(t, terragruntOptions, "example_output")
    assert.Equal(t, "expected_output_value", output)
}
