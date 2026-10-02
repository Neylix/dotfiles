# Global instructions

## Unslop skill

The `unslop` skill contains the mandatory rules for all writing. Load it with the skill tool at these moments, before writing anything else:

- At the start of every session.
- After every context compaction.
- After a revert, undo, or any other event that removes conversation content.
- Whenever the unslop rules are no longer present in context.

Use the exact skill ID `unslop`. Perform the tool call rather than only acknowledging this instruction. When the rules are already in context, do not load the skill again.

Apply the rules to all writing: responses, plans, commit messages, pull request descriptions, documentation, code comments or anywhere else.
