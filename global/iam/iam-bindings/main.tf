module iam_bindings {
    source = "../../../modules/iam/iam-bindings"
    project_id =  var.project_id
    roles = each.value
    for_each = var.roles
}