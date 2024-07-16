package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	// Define the options for Terraform
	terragruntOptions := &terraform.Options{
		// Path to the Terraform code to be tested
		TerraformDir: "../global/networking/vpc_subnets",
	}

	// Run `terragrunt apply` and fail the test if there are any errors
	defer terraform.Destroy(t, terragruntOptions)
	terraform.InitAndApply(t, terragruntOptions)

	// Validate your code
	output := terraform.Output(t, terragruntOptions, "example_output")
	assert.Equal(t, "expected_output_value", output)
}
