#!/usr/bin/env python3

import json
import sys
import google.auth
from googleapiclient.discovery import build

def create_firewall_rule(compute, project, name, direction, action, priority, network, ranges, allowed):
    firewall_body = {
        "name": name,
        "direction": direction,
        "priority": priority,
        "network": f"projects/{project}/global/networks/{network}",
        "allowed": [
            {
                "IPProtocol": allowed["protocol"],
                "ports": allowed["ports"]
            }
        ],
        "sourceRanges": ranges if direction == "INGRESS" else None,
        "destinationRanges": ranges if direction == "EGRESS" else None
    }

    return compute.firewalls().insert(
        project=project,
        body=firewall_body
    ).execute()

def main():
    try:
        input_data = json.loads(sys.stdin.read())
        network = input_data['network']
        region = input_data['region']
        project = input_data['project']

        credentials, _ = google.auth.default()
        compute = build('compute', 'v1', credentials=credentials)

        firewall_rules = [
            {
                "name": "allow-egress-to-gke-master",
                "direction": "EGRESS",
                "action": "ALLOW",
                "priority": 1000,
                "network": network,
                "ranges": ["35.191.0.0/16", "130.211.0.0/22"],
                "allowed": {
                    "protocol": "tcp",
                    "ports": ["443"]
                }
            }
            {
                "name": "allow-internal-communication",
                "direction": "INGRESS",
                "action": "ALLOW",
                "priority": 1000,
                "network": network,
                "ranges": ["10.0.0.0/8"],
                "allowed": {
                    "protocol": "all",
                    "ports": []
                }
            }
            ] 

        for rule in firewall_rules:
            create_firewall_rule(
                compute, project, rule["name"], rule["direction"], rule["action"], rule["priority"],
                rule["network"], rule["ranges"], rule["allowed"]
            )

        print(json.dumps({"status": "success"}))
    except Exception as e:
        print(json.dumps({"status": "failure", "error": str(e)}), file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
