package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestModuleDisabled(t *testing.T) {
	//t.Parallel()
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"enabled": false,
			"team": "team",
			"environment": "test",
			"region": "dr",
			"name": "app",
			"attributes": []string{"demo"},
		},

	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	verifyModuleDisabled(t, terraformOptions)

}

func verifyModuleDisabled(t *testing.T, terraformOptions *terraform.Options) {

	id := terraform.Output(t, terraformOptions, "id")
	assert.Empty(t, id, "id was not empty.")

	name := terraform.Output(t, terraformOptions, "name")
	assert.Empty(t, name, "tags was not empty.")

	tags := terraform.OutputMap(t, terraformOptions, "tags")
	assert.Empty(t, tags, "tags was not empty.")

}
