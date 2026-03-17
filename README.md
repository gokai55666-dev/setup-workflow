#!/usr/bin/env bats

load 'libs/assert'

@test "true is true" {
  run true
  assert_success
}

@test "list contains something" {
  run ls .
  assert_output --partial "README.md"
}
```

Include `libs/assert` or similar helpers. You might want `bats-support` & `bats-assert`.

# Setup Workflow

A learning repository to build and experiment with GitHub Actions workflows.

---

## 📋 What’s Inside

- `.github/workflows/learn-github-actions.yml` – A basic CI workflow to set up Node.js, install a tool (`bats`), and check its version.
- A starter setup to explore more advanced workflows (branch filters, caching, matrix builds, etc.).

---

## 🚀 Workflow: `learn-github-actions.yml`

Triggered on every `push`.

What it does:

1. Checks out your repository’s code.
2. Sets up a specified version of Node.js.
3. Installs `bats` globally.
4. Runs `bats -v` to print its version.

---

## 🛠 How to Use

- Edit the workflow file under `.github/workflows/`.
- Push to any branch — the workflow runs automatically.
- To customize, you can:
  - Change `node-version` in setup-node.
  - Add more steps (tests, linting, building…).
  - Add triggers like `pull_request`, branch filters, or manual dispatch.

---

## ✅ Best Practices

- Use explicit versions for tools (Node.js, bats, etc.)
- Name your jobs and steps for readability.
- Cache dependencies if possible.
- Limit when the workflow triggers (specific branches, PRs, schedule).
- Reuse workflows if you have multiple repos doing similar tasks.

---

## 🧪 Getting Help & Learning More

- [GitHub Docs: Workflow syntax for GitHub Actions](https://docs.github.com/actions/learn-github-actions/workflow-syntax-for-github-actions) — YAML reference.  
- [GitHub Docs: setup-node action](https://docs.github.com/actions/using-jobs/workflows/using-github-actions set-up-node) — details for versioning, caching etc.  

---

## 🔧 Contact / Contribute

If you want to suggest improvements, feel free to open issues or PRs. Happy to collaborate!