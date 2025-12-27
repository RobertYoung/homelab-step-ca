# homelab-step-ca

Step CA service deployment for my homelab.

## Prerequisites

- [mise](https://mise.jdx.dev/) for tool version management
- [aws-vault](https://github.com/99designs/aws-vault) for AWS credentials
- SSH key access to private Ansible role repositories

## Setup

```bash
# Install tool versions
mise install

# Install external Ansible roles
aws-vault exec iamrobertyoung:home-assistant-production:p -- ansible-galaxy install -r requirements.yml -p .roles
```

## Usage

```bash
# Test connectivity
aws-vault exec iamrobertyoung:home-assistant-production:p -- ansible step_ca -m ping

# Run full playbook
aws-vault exec iamrobertyoung:home-assistant-production:p -- ansible-playbook playbooks/site.yml

# Run specific role only
aws-vault exec iamrobertyoung:home-assistant-production:p -- ansible-playbook playbooks/site.yml --tags step-ca
```

## Linting

```bash
yamllint .
ansible-lint
```

## Structure

```
.
├── inventories/          # Ansible inventory
│   ├── hosts.yml
│   └── group_vars/
├── playbooks/            # Main playbook
│   └── site.yml
├── roles/                # Custom Ansible roles
│   └── step-ca/
├── files/                # Static files
├── templates/            # Shared Jinja2 templates
├── host_vars/            # Host-specific variables
└── requirements.yml      # External role dependencies
```
