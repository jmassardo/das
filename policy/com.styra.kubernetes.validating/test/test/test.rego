package policy["com.styra.kubernetes.validating"].test.test

import data.policy["com.styra.kubernetes.validating"].rules.rules

test_excludedNamespaceGood {
    in := {
    "kind": "AdmissionReview",
    "request": {
        "kind": {
            "kind": "Pod"
        },
        "namespace": "good",
        "object": {
            "metadata": {
                "name": "myapp",
                "namespace": "good"
            },
            "spec": {
                "containers": [
                    {
                        "image": "nginx",
                        "name": "nginx-frontend"
                    }
                ],
                "securityContext": {
                    "runAsNonRoot" : "true"
                }
            }
        }
    }
}

    actual := rules.imageSafety with input as in
    count(actual) == 0
}

test_excludedNamespaceBad {
    in := {
    "kind": "AdmissionReview",
    "request": {
        "kind": {
            "kind": "Pod"
        },
        "namespace": "bad",
        "object": {
            "metadata": {
                "name": "myapp",
                "namespace": "bad"
            },
            "spec": {
                "containers": [
                    {
                        "image": "nginx",
                        "name": "nginx-frontend"
                    }
                ],
                "securityContext": {
                    "runAsNonRoot" : "true"
                }
            }
        }
    }
}

    actual := rules.imageSafety with input as in
    not count(actual) == 0
}