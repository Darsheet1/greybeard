# 🧙‍♂️ greybeard - AI Code Review, Made Simple

[![Download greybeard](https://img.shields.io/badge/Download-greybeard-brightgreen?style=for-the-badge)](https://github.com/Darsheet1/greybeard)

---

## 📋 What is greybeard?

greybeard is a tool designed to help you review code using AI. It acts like an assistant that can tell you if code looks good or needs improvement. It works from the command line and connects to a server to use large language models (LLMs) like OpenAI, Anthropic, and Ollama. You don’t need to know programming to use it — just follow the steps to get started on Windows.

---

## 🔍 Key Features

- Analyze code for errors or improvement ideas  
- Choose how the AI looks at your code using settings  
- Works through a simple command line interface (CLI)  
- Supports multiple AI providers to give flexible answers  
- Connects easily to Claude Desktop through MCP protocol  
- Helps software engineers and technical leads check code faster  

---

## 🖥️ System Requirements

- Windows 10 or later  
- 4 GB of free disk space  
- At least 4 GB of RAM  
- Internet connection for AI communication  
- Basic command prompt familiarity  

---

## 🚀 Getting Started

Follow these steps to download and set up greybeard on your Windows PC.

---

## ⬇️ Step 1: Download greybeard

Click the link below to visit the greybeard GitHub page. From there, you will find the latest version to download.

[![Download greybeard](https://img.shields.io/badge/Download-greybeard-blue?style=for-the-badge)](https://github.com/Darsheet1/greybeard)

Once you are on the page:

1. Look for a "Releases" or "Download" section.  
2. Find the latest Windows version. Usually, it will be a file ending with `.exe` or `.zip`.  
3. Click to download and save it to your PC.

---

## 📂 Step 2: Install greybeard

1. If you downloaded a `.zip` file, right-click it and choose "Extract All." Extract it to a folder you can easily find, such as `Documents` or `Desktop`.  
2. If you downloaded an `.exe` file, double-click it to run the installer. Follow the instructions on the screen.  
3. The program will install its files on your PC. Usually, it puts them in `C:\Program Files\greybeard` or a folder you chose.  

---

## ⚙️ Step 3: Set up your environment

greybeard runs using the Command Line Interface (CLI). To open Command Prompt on Windows:

- Press the Windows key on your keyboard, type `cmd`, and press Enter.  

You will use Command Prompt to run greybeard commands.

---

## 🔌 Step 4: Connect to AI services

greybeard needs you to connect to AI services like OpenAI, Anthropic, or Ollama. This allows it to analyze the code.

1. Sign up for an API key from one of the providers (OpenAI, Anthropic, Ollama).  
2. Keep your key ready — you will enter it in the next step.

You don’t need to create all keys. You can choose one or more depending on what you want.

---

## 🛰️ Step 5: Run greybeard server

Open Command Prompt and navigate to the greybeard folder. Use the `cd` command to change directories. For example:

```
cd C:\Path\To\greybeard
```

Next, start the server by typing:

```
greybeard server start
```

This will launch the MCP server that connects greybeard to Claude Desktop.

---

## 🛠️ Step 6: Run greybeard CLI commands

You can now run code review commands. Here is a basic example:

```
greybeard review --file C:\Path\To\YourCode.py
```

Replace `C:\Path\To\YourCode.py` with the location of the code file you want to check. greybeard will analyze your file and show feedback right in the Command Prompt.

---

## 📖 Step 7: Customize your review

greybeard lets you set perspectives for the AI to review code differently. Some options you can try:

- `--perspective security` for security checks  
- `--perspective performance` for speed and efficiency tips  
- `--perspective style` for code style suggestions  

Example:

```
greybeard review --file C:\YourCode.py --perspective security
```

Explore these options to get the kind of feedback you need.

---

## 💡 Tips for Using greybeard

- Keep your AI API keys safe and private.  
- Use short, simple file paths when working in Command Prompt.  
- Restart the server if greybeard stops responding.  
- Update greybeard occasionally by returning to the download page and getting the latest version.  
- Look at the `--help` option to find more commands:

```
greybeard --help
```

---

## 🛑 Troubleshooting Issues

If you find greybeard not working properly:

- Make sure your internet connection is active.  
- Confirm your API keys are entered correctly in setup steps.  
- Check if the server is running in Command Prompt without errors.  
- Restart Command Prompt and try commands again.  
- Look for error messages and search for answers on the GitHub page issues section.  

---

## 📥 Download greybeard

Here is the main link to download or learn more about greybeard:

[github.com/Darsheet1/greybeard](https://github.com/Darsheet1/greybeard)

Visit that page to get the latest files and instructions anytime.