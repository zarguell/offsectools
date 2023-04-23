# Offensive Security Tools

A repo to maintain a list of Offensive Security Tools (primarily those available via Git repos only and not with packages readily availble), and continuously download, update, and maintain them.

# Usage:

- tool_list.txt contains a list of all tools to be maintained by owner, repo, and file extension to grab
- loop_tools.sh grabs the tools list, iterates through the tools, and uses grab_release.sh to grab the latest releases