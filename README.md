# Offensive Security Tools

A repo to maintain a list of Offensive Security Tools (primarily those available via Git repos only and not with packages readily availble), and continuously download, update, and maintain them.

# Overview:

- tool_list.txt contains a list of all tools to be maintained by owner, repo, and file extension to grab
- loop_tools.sh grabs the tools list, iterates through the tools, and uses grab_release.sh to grab the latest releases

# Usage

Run check_urls.sh to output the possible release filenames. This can help to determine the regex to enter in the tool list.

```bash
scripts/check_urls.sh lkarlslund Adalanche
```

To add a submodule, add to modules directory using standard git commands:

```bash
git submodule add https://github.com/CravateRouge/autobloody
```

To update the tools outside of Github Actions:
```bash
./scripts/loop_tools.sh ./scripts/tool_list.txt
```

To recursively clone all submodules:
```bash
git clone --recurse-submodules https://github.com/zarguell/offsectools
```
