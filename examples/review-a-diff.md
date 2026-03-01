# Example: Review a git diff

## What this does

Pipe a `git diff` into `greybeard analyze` to get a Staff-level review of the changes.

## Command

```bash
git diff main | greybeard analyze --mode review --pack staff-core
```

## Sample output

```markdown
## Summary

This diff introduces a new async background task for sending email notifications.
The core logic looks sound, but there are meaningful operational concerns worth
addressing before shipping to production.

## Key Risks

- **Silent failure mode**: The task catches all exceptions and logs them, but there's
  no alerting when the failure rate exceeds a threshold. This will fail silently in
  production and emails simply won't be sent.

- **No retry logic**: Failed sends are logged but not retried. If the SMTP server
  is briefly unavailable, messages are permanently lost.

- **Unclear ownership**: There's no runbook or owner annotation. Who is responsible
  for investigating when email delivery drops?

## Tradeoffs

| Option | Benefit | Cost |
|--------|---------|------|
| Ship as-is | Faster delivery | Silent failures, no recovery path |
| Add alerting first | Observable failures | ~1 day additional work |
| Use a queue (SQS, etc.) | Durable, retryable | Additional complexity and cost |

## Questions to Answer Before Proceeding

1. What is the acceptable email delivery failure rate, and how will we know when we're
   exceeding it?
2. Who is the on-call owner when email delivery fails? Is this in the runbook?
3. Should failures be retried, and if so, with what backoff strategy?
4. Is there a monitoring dashboard for email delivery rates?

## Suggested Communication Language

> "This looks good overall — the logic is clean. Before we ship, I want to make sure
> we're observable when this fails. Silent email delivery failures are hard to catch.
> Can we add a simple failure rate alert and a note in the runbook?"

---
*Assumption: This is a new feature, not a replacement for an existing email system.*
```

## Variations

```bash
# Review with mentor mode (more explanation of reasoning)
git diff main | greybeard analyze --mode mentor --pack staff-core

# Review from on-call perspective
git diff main | greybeard analyze --mode review --pack oncall-future-you

# Self-check before opening a PR
git diff main | greybeard self-check --context "Adding email notifications for Pro users"
```
