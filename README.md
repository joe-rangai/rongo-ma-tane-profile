# Rongo mā Tāne Individual Sensory Profile

Part of Te Ara Whakamana. Ākonga, whānau and kaiako build a sensory profile together, then add a review each year on the Poutama chart. It is not a diagnostic tool.

**Test site:** https://joe-rangai.github.io/rongo-ma-tane-profile/

Anyone with this link can open the site, so share it only with testers. It is hidden from Google and other search engines.

## Where profiles are kept

Profiles stay in the browser on the device being used, or in a file saved with **Save file**. Nothing typed into the tool is sent to GitHub or this repository.

Never commit saved profiles (`.json`) or printouts (`.pdf`), because they hold real ākonga information. `.gitignore` blocks both.

## Making changes

1. Edit `src/rongo-ma-tane.html`.
2. Run `build.ps1`. It writes `index.html` (the site) and `Rongo-ma-Tane-Sensory-Profile.html` (a single file you can send to someone).
3. Commit and push. The site updates a minute or two later.

To turn on Google Drive saving, see [DRIVE-SETUP.md](DRIVE-SETUP.md).
