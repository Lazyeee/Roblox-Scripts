# Roblox Script to Loadstring Guide

This guide will show you how to upload your Roblox scripts to GitHub and then convert them into a loadstring format, so they can be easily executed within Roblox.

### Requirements

- **GitHub Account**: You will need a GitHub account to store your scripts.
- **Text Editor**: Any editor like VSCode, Sublime, or Notepad++.
- **Roblox Studio**: For testing your scripts.

---

## Step 1: Create a GitHub Repository

1. Log in to GitHub.
2. Click on the **+** icon in the top-right corner and select **New repository**.
3. Name your repository (e.g., `Roblox-Scripts`).
4. Set the repository to public (so it’s accessible) or private if you want it hidden.
5. Optionally, add a description, README, or `.gitignore`.
6. Click **Create repository**.

---

## Step 2: Upload Your Script

1. Once inside your repository, click on **Add file** > **Create new file**.
2. Name the file with a `.lua` extension (e.g., `my-script.lua`).
3. Paste your Roblox Lua script into the file.
4. Scroll down and click **Commit new file** to save your changes.

---

## Step 3: Getting the Raw URL

1. Go to your newly created file in the repository.
2. Click on the **Raw** button to get the direct raw URL of the script.
   - The URL should look like:  
     `https://raw.githubusercontent.com/username/repo-name/branch-name/file-name.lua`

---

## Step 4: Using the Loadstring in Roblox

Once you have the raw URL of your script, you can use it with the `loadstring` function in Roblox. Here’s how to use it:

```lua
local scriptURL = "https://raw.githubusercontent.com/username/repo-name/branch-name/file-name.lua"
local success, err = pcall(function()
    loadstring(game:HttpGet(scriptURL))()
end)

if not success then
    warn("Error loading script: ", err)
end
```

- Replace `username`, `repo-name`, `branch-name`, and `file-name` in the URL with your actual GitHub information.
- This script fetches the code from your GitHub repository and executes it directly in Roblox.

---

## Step 5: Testing in Roblox Studio

1. Open Roblox Studio.
2. Insert a **Script** or **LocalScript** in the game.
3. Paste the `loadstring` code with your URL and test if it works.

---

## Additional Notes

- Make sure the script URL is publicly accessible (if the repo is private, you will need to adjust your access settings).
- Always test your scripts in a safe environment before sharing them.
- Be cautious with what you load through `loadstring` as it can execute any code, including harmful scripts.

---

## FAQ

### 1. Can I keep my repository private?
Yes, but you will need to provide access tokens or make the file accessible via a specific method if the loadstring needs to work for others.

### 2. What if my script doesn’t work with `loadstring`?
Ensure that your script is properly formatted and that the URL is correct. Also, check if Roblox’s `HttpGet` function is allowed in the game’s settings.

---

That’s it! Now you can convert your Roblox scripts into loadstrings and host them on GitHub for easy execution.
