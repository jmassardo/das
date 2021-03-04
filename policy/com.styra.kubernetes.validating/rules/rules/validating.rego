package policy["com.styra.kubernetes.validating"].rules.rules

monitor[decision] {
	parameters := {
		"whitelist": {
			"registry.domain.tld": set()
		}
	}

	data.library.v1.kubernetes.admission.workload.v1.repository_unsafe_exact[message]
		with data.library.parameters as parameters

	decision := {
		"allowed": false,
		"message": message
	}
}

# test

# das change
enforce[decision] {
	data.library.v1.kubernetes.admission.workload.v1.block_latest_image_tag[message]

	decision := {
		"allowed": false,
		"message": message
	}
}
