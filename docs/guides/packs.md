# Content Packs

Content packs define the perspective, tone, and heuristics used during a review. They're plain YAML — human-editable, version-controllable, and easy to share.

---

## Built-in packs

| Pack | Perspective | Best for |
|------|-------------|----------|
| `staff-core` | Staff Engineer | General architecture and code reviews |
| `oncall-future-you` | On-call engineer, 3am | Operational readiness, failure mode review |
| `mentor-mode` | Experienced mentor | Learning, teaching, growth-focused feedback |
| `solutions-architect` | Solutions Architect | System design, entity modeling, build vs buy |
| `idp-readiness` | Platform Engineering | IDP maturity, platform vs process decisions |

```bash
# See all available packs with descriptions
greybeard packs

# Use a specific pack
git diff main | greybeard analyze --pack oncall-future-you
```

---

## Installing community packs

Anyone can publish a greybeard pack repo on GitHub. Install packs from any public repo:

```bash
# Install all packs from a repo's packs/ directory
greybeard pack install github:owner/repo

# Install a single file
greybeard pack install github:owner/repo/packs/my-pack.yaml

# Install from a raw URL
greybeard pack install https://example.com/my-pack.yaml
```

Installed packs are cached at `~/.greybeard/packs/` and available by name just like built-ins:

```bash
git diff main | greybeard analyze --pack my-pack-name
```

### Managing installed packs

```bash
# List installed remote packs
greybeard pack list

# Re-download (refresh) a source
greybeard pack install github:owner/repo --force

# Remove a source
greybeard pack remove owner__repo
```

---

## Using a local custom pack

Create a `.yaml` file and pass it directly — no install needed:

```bash
cat design-doc.md | greybeard analyze --pack ./my-team.yaml
```

---

## Writing a pack

Packs are YAML files with the following structure:

```yaml
name: my-pack
description: Short description shown in greybeard packs output

perspective: |
  Who is speaking. Be specific — this shapes the entire tone.
  Example: "A Staff Engineer on a team that owns 20+ services and
  has been paged about this exact type of failure before."

tone: calm and direct, not condescending

focus_areas:
  - operational impact
  - ownership clarity
  - long-term maintenance cost

heuristics:
  - "Would I be okay getting paged about this at 3am?"
  - "Who is the last person to understand this, and what happens when they leave?"
  - "Is this solving today's problem or a hypothetical future one?"

example_questions:
  - "Who owns the runbook for when this fails?"
  - "What does a 3am failure look like?"
  - "Is the rollback story clear and tested?"

communication_style: |
  Optional. How to frame concerns — collaborative, teaching, direct, etc.
```

See the built-in packs in [`packs/`](https://github.com/btotharye/greybeard/tree/main/packs) for complete examples.

### Tips for writing good packs

- **Be specific about perspective.** "A Staff Engineer" is vague. "A Staff Engineer who has been paged about caching failures at 3am and spent a week diagnosing a silent data corruption bug" is much better — the model will reason from that specificity.
- **Heuristics are the soul of the pack.** They're the questions your perspective would instinctively ask. Make them memorable and concrete.
- **Tone matters more than you think.** The difference between "skeptical but fair" and "blunt and impatient" meaningfully changes the output.
- **Focus areas filter the noise.** Without them, the model might surface concerns that aren't relevant to your perspective.

---

## Publishing a pack

1. Create a public GitHub repo (e.g. `your-handle/greybeard-packs`)
2. Add a `packs/` directory with `.yaml` files
3. Anyone can install it with:

```bash
greybeard pack install github:your-handle/greybeard-packs
```

Feel free to open an issue on the greybeard repo to get your pack listed.
