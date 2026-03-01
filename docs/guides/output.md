# Saving Output

All review commands support an `--output` flag to save the result to a markdown file.

## Basic usage

```bash
git diff main | greybeard analyze --output review.md
```

## Organised by date

```bash
# Create a dated review file
git diff main | greybeard analyze \
  --output "reviews/$(date +%Y-%m-%d)-auth-migration.md"
```

## Combine with other flags

```bash
cat design-doc.md | greybeard analyze \
  --mode mentor \
  --pack oncall-future-you \
  --output reviews/design-doc-review.md
```

```bash
greybeard self-check \
  --context "Adding a new microservice for notifications" \
  --output self-check-2024-03-01.md
```

## Output format

Output is always structured Markdown:

```markdown
## Summary
...

## Key Risks
...

## Tradeoffs
...

## Questions to Answer Before Proceeding
...

## Suggested Communication Language
...

---
*Assumptions: ...*
```

## Tip: commit reviews to your repo

Some teams commit greybeard reviews alongside their PRs or ADRs:

```
docs/
  decisions/
    2024-03-01-auth-migration.md          # the ADR
    2024-03-01-auth-migration-review.md   # the greybeard review
```
