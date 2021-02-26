package policy["com.styra.kubernetes.mutating"].monitor

import data.library.v1.kubernetes.monitor.v2 as monitor

monitoring_failure[[resource, errormsg]] {
  monitor.monitoring_failure[[resource, errormsg]] with data.context as {
    "policy_type": "mutating",
    "system_id": "a7381852f0e44728b23bba9deaa927a4",
    "system_type": "kubernetes",
  }
}

number_failures = x {
       x := count(monitoring_failure)
}
