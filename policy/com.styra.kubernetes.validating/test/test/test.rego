package policy["com.styra.kubernetes.validating"].test.test

import data.policy["com.styra.kubernetes.validating"].rules.rules

test_allow_specific_image_version {
    in := {
  "kind": "AdmissionReview",
  "request": {
    "kind": {
      "kind": "Pod",
      "version": "v1"
    },
    "object": {
      "metadata": {
        "name": "myapp"
      },
      "spec": {
        "containers": [
          {
            "image": "nginx:0.1.0",
            "name": "nginx-frontend"
          },
        ]
      }
    }
  }
}

    actual := rules.monitor with input as in
    count(actual) == 0
}

test_block_latest_version {
    in := {
  "kind": "AdmissionReview",
  "request": {
    "kind": {
      "kind": "Pod",
      "version": "v1"
    },
    "object": {
      "metadata": {
        "name": "myapp"
      },
      "spec": {
        "containers": [
          {
            "image": "nginx:latest",
            "name": "nginx-frontend"
          },
        ]
      }
    }
  }
}

    actual := rules.monitor with input as in
    not count(actual) == 0
}