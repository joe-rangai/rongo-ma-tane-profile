# Turning on Google Drive for the Rongo mā Tāne profile

The profile tool can save to and open from Google Drive, so ākonga, whānau and kaiako can all work on the same profile. Google needs to know the tool is allowed to do this. This is a one-time setup. It's free and takes about 15 minutes. It's best done by whoever manages the school's Google account.

Drive only works on the **online version** of the tool, for example on GitHub Pages. It doesn't work when the HTML file is opened straight from a folder, because Google only signs people in on web addresses it has been told about.

## What the tool can see

The tool asks for one Google permission: **"See, edit, create and delete only the specific Google Drive files you use with this app"** (`drive.file`). It can only see profile files it saved itself, or files someone picks with the Open from Drive button. It can't see anything else in anyone's Drive. Google rates this as a low-risk permission, so the tool doesn't need Google's full app review.

## Steps

1. Go to <https://console.cloud.google.com> and sign in with the school's Google account.
2. **Create a project.** Use the project menu at the top, choose **New project** and call it `Rongo ma Tane Profile`.
3. **Turn on two APIs.** Go to **APIs & Services → Library** and enable **Google Drive API**, then **Google Picker API**.
4. **Set up the sign-in screen.** Go to **APIs & Services → OAuth consent screen** (it may be called **Google Auth Platform → Branding**).
   - App name: `Rongo mā Tāne Sensory Profile`. Add a support email.
   - **Audience:**
     - Choose **Internal** if everyone who signs in has a school Google account.
     - Choose **External** if whānau will sign in with their own Gmail. Then press **Publish app** so anyone with a Google account can sign in. Until it's published, only the test users you list can sign in.
   - **Data access / Scopes:** add `https://www.googleapis.com/auth/drive.file`.
5. **Create the sign-in ID.** Go to **APIs & Services → Credentials → Create credentials → OAuth client ID**.
   - Application type: **Web application**
   - **Authorised JavaScript origins:** add the address the tool lives at, with no path on the end. For example:
     - `https://joe-rangai.github.io` (the test site)
     - `http://localhost:8765` (only needed for testing on this computer)
   - Copy the **Client ID**. It ends in `.apps.googleusercontent.com`.
6. **Create the API key.** Go to **Credentials → Create credentials → API key**, then press **Edit API key**:
   - Application restrictions: **Websites**. Add `https://joe-rangai.github.io/*`.
   - API restrictions: **Restrict key** → tick **Google Picker API**.
   - Copy the key.
7. **Find the project number.** Go to **Project settings** (or the project dashboard) and copy the **Project number**.
8. **Put the three values into the tool.** Open `src/rongo-ma-tane.html`, search for `DRIVE_CONFIG` and fill it in:

   ```js
   var DRIVE_CONFIG = { clientId: '1234-abc.apps.googleusercontent.com', apiKey: 'AIza...', appId: '123456789012' };
   ```

   Then run `build.ps1`, and commit and push `index.html` (or upload it to wherever the tool is hosted).

These three values aren't passwords. Every website that uses Google sign-in has them in its page. Google only accepts them from the addresses listed in step 5 and step 6.

## How people use it

1. Make a shared Drive folder, for example `Rongo mā Tāne profiles`. Share it with the kaiako, and with whānau for their own child's profile.
2. On the tool, press **Sign in with Google**, then **Choose folder** and pick that folder. Each device asks for this once.
3. **Sync with Drive** saves the open profile to that folder. Once a profile is in Drive, pressing Sync again first brings in anything newer that someone else saved, then saves. Each section (Ākonga, Whānau, Kaiako, Tikanga and so on) keeps whichever version was edited most recently.
4. **Open from Drive** brings a profile someone else saved onto this device.

## Privacy

Student profiles will sit in the school's Google Drive, under the school's usual sharing settings. Check this fits the school's privacy policy and the Privacy Act 2020. Share each profile only with the people who need it.
