# Pack Schema

Content packs are YAML files. All fields except `name` are optional, but the more you fill in, the better the reviews.

## Full schema

```yaml
# Required
name: my-pack                    # Used to reference this pack by name

# Strongly recommended
perspective: |                   # Who is speaking — be specific and vivid
  A Staff Engineer with 10+ years of production experience who has been paged
  at 3am more than they'd like to admit...

tone: calm and direct            # Shapes the entire output style

description: |                   # Shown in `greybeard packs` output
  Short description of what this pack is for.

# Good to have
focus_areas:                     # Filters which concerns get surfaced
  - operational impact
  - ownership clarity
  - long-term maintenance cost

heuristics:                      # The questions this perspective instinctively asks
  - "Would I be okay getting paged about this at 3am?"
  - "Who is the last person to understand this, and what happens when they leave?"

example_questions:               # Concrete questions to surface in reviews
  - "Who owns the runbook when this fails?"
  - "What does a 3am failure look like?"

communication_style: |           # How to frame concerns
  Raise concerns as questions, not vetoes.
  Be specific about blast radius.
```

## Field reference

### `name` (string, required)

The identifier used to reference this pack. Must be unique within your installed packs. Use kebab-case.

```yaml
name: my-team-platform
```

### `perspective` (string, recommended)

Who is doing the review. The more specific and vivid, the better the output.

**Vague (worse):**
```yaml
perspective: A senior engineer
```

**Specific (better):**
```yaml
perspective: |
  A Staff Engineer who owns 40+ microservices and has debugged a silent
  data corruption bug that went undetected for two weeks.
```

### `tone` (string, recommended)

A few words describing the communication tone. Directly affects how concerns are phrased.

```yaml
tone: calm and direct, never condescending
```

### `description` (string)

Short description shown in `greybeard packs` output.

### `focus_areas` (list of strings)

The domains this perspective cares most about. Helps focus the review.

```yaml
focus_areas:
  - deployment safety
  - database migration correctness
  - golden path adherence
```

### `heuristics` (list of strings)

The mental models and gut-checks this perspective applies. Phrased as questions or principles.

```yaml
heuristics:
  - "Would I be okay getting paged about this at 3am?"
  - "Is the failure mode obvious or does it require tribal knowledge?"
  - "Could this fail silently — no errors, no alerts, just wrong behavior?"
```

### `example_questions` (list of strings)

Concrete questions this perspective would ask. These surface directly in reviews.

```yaml
example_questions:
  - "Who owns the runbook for when this fails?"
  - "Is the DB migration backwards-compatible with the running version?"
```

### `communication_style` (string)

How to frame concerns — affects output tone and phrasing.

```yaml
communication_style: |
  Frame concerns as tradeoffs, not verdicts.
  Reference internal tooling by name when relevant.
  Distinguish between "this will definitely break" and "this worries me because...".
```

---

## Minimal valid pack

```yaml
name: minimal
perspective: A cautious engineer who has seen things go wrong
tone: direct
```

## Tips

- **Perspective specificity is the highest-leverage field.** A vivid, specific perspective produces much better reviews than a generic one.
- **Heuristics are the soul of the pack.** Make them memorable and concrete — "would I be paged about this?" is better than "consider operational impact."
- **Tone shapes the whole output.** "Skeptical but fair" and "blunt and impatient" produce meaningfully different reviews.
- **Don't over-specify focus areas.** 3–6 focused areas is better than 15 vague ones.
