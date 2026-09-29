# Acquisition session authorization

On 2026-09-29 the owner authorized a separate local browser session solely for Stage documentation acquisition, normal SSO, byte-preserving extraction verification before scaling, and preservation of existing progress and all other restrictions. The owner completed normal sign-in and selected **Continue with verified Edge** after Brave was identified as installed.

The dedicated Edge profile is outside OneDrive and Git under `%LOCALAPPDATA%\TAB\SCALE-Intelligence\private\stage-edge-profile`. No cookies, credentials, personal browser profile, or authentication exchange was copied or archived. TLS validation, Chromium sandboxing, and CSP enforcement remain enabled.

Playwright 1.62.0 and Edge 154.0.4258.37 were used for the capability test. AIM's entry returned HTTP 200 and 25,125 bytes. `APIResponse.body()` and the browser navigation's `Response.body()` produced the same SHA-256, `84e89e1834f1290d282ea279ebf06187b236e88ce4715824fddbee371d9921da`; saving and rereading the bytes preserved that hash. This verifies the transport capability, not article coverage, the five-article pilot, or corpus fidelity.
