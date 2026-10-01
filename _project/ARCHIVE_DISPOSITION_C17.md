# Archive disposition

The owner requested archiving repository material no longer needed for active or planned work. One file met that condition: the old C11/Sol restart prompt. It contained a completed source packet and superseded acceptance/scope instructions. The [current Astra prompt](../04_SCALE_ASTRA_RESTART_PROMPT.md) replaces it.

| Original path | Preserved archive path | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| `04_SCALE_SOL_RESTART_PROMPT.md` | `archive/retired-prompts/04_SCALE_SOL_RESTART_PROMPT_C11.md` | 19,645 | `19ebc054bbb19764049401b940571776f635b19605c8361e5330c8471f89a331` |

The original path now contains a short redirect so historical links still lead to the current entry. C11's original path/hash records are unchanged: resolve that historical identity through the mapping above, rather than comparing their old hash to the redirect. The archived copy preserves the exact original bytes. [Machine-readable disposition and restoration instructions](archive-disposition-continuation17.json).

The AIM and SDK prompts (`01` and `02`) remain unchanged. Collectors, SDK authority/revalidation, delivery inventories, verifiers and tests still use their exact paths and bytes. Source originals, reviewed knowledge and evidence needed for provenance or future work also remain active. Their age is not evidence that they are unused. No private AEKR payload was added to Git.

Archive payload is excluded from ordinary `rg` discovery by `.ignore`, from `git archive` exports by `.gitattributes`, and from the existing declared search/test inputs. The archived file remains tracked in this private repository as requested. Later archive access requires a scoped owner request; this metadata does not authorize loading retired instructions into ordinary context.

Restoration is reversible: after a scoped owner request, verify the archived size/hash, preserve the current redirect, copy the exact original bytes back to the recorded original path, and review active links before reactivating anything. No deletion or history rewrite was performed.
