# build-system

This action will automatically generate tags and create releases , when a pull request from `release/{major}.{minor}` or `hotfix/*` is merged to `main`

**Example usage**
```yaml
- id: auto-tag
  uses: cloud-tek/actions/auto-tag@v0.7
  name: auto-tag
  with:
    branch: main
    configuration: configuration.changelog.json
```

**Example configuration**

```json
{
    "categories": [
      {
        "title": "## 🚀 Features",
        "labels": ["feature"]
      },
      {
        "title": "## 🐛 Fixes",
        "labels": ["fix"]
      },
      {
        "title": "## 🧪 Tests",
        "labels": ["test"]
      },
      {
        "title": "## 🧪 Tests and some 🪄 Magic",
        "labels": ["test", "magic"],
        "exclude_labels": ["no-magic"],
        "exhaustive": true
      }
    ],
    "ignore_labels": [
      "ignore"
    ],
    "sort": {
      "order": "ASC",
      "on_property": "mergedAt"
    },
    "template": "${{CHANGELOG}}\n\n<details>\n<summary>Uncategorized</summary>\n\n${{UNCATEGORIZED}}\n</details>",
    "pr_template": "- ${{TITLE}}\n   - PR: #${{NUMBER}}",
    "empty_template": "- no changes",
    "label_extractor": [
      {
        "pattern": "(.) (.+)",
        "target": "$1",
        "flags": "gu"
      },
      {
        "pattern": "\\[Issue\\]",
        "on_property": "title",
        "method": "match"
      }
    ],
    "duplicate_filter": {
      "pattern": "\\[ABC-....\\]",
      "on_property": "title",
      "method": "match"
    },
    "transformers": [
      {
        "pattern": "[\\-\\*] (\\[(...|TEST|CI|SKIP)\\])( )?(.+?)\n(.+?[\\-\\*] )(.+)",
        "target": "- $4\n  - $6"
      }
    ],
    "max_tags_to_fetch": 200,
    "max_pull_requests": 200,
    "max_back_track_time_days": 365,
    "exclude_merge_branches": [
      "Owner/qa"
    ],
    "tag_resolver": {
      "method": "semver",
      "filter": {
        "pattern": "api-(.+)",
        "flags": "gu"
      }
    },
    "base_branches": [
      "dev"
    ]
}
```