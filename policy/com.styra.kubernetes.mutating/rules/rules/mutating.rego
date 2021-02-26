package policy["com.styra.kubernetes.mutating"].rules.rules

monitor[decision] {
  parameters := {
    "labels": {
      "env": "home-lab"
    }
  }

  data.library.v1.kubernetes.mutating.v1.add_missing_labels[decision]
    with data.library.parameters as parameters
}
