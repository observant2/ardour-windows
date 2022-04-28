docker run --rm -it -v $(pwd)/ardour/:/home/ardour/src/ ardour-builder

<div align="center">
  <p>
    <h1>
      <a href="https://github.com/ZetaoYang/ardour-build">
      </a>
      <br />
      Ardour Unofficial Builds
    </h1>
    <h4>Github Actions Builds of Ardour for Linux, macOS and Windows.</h4>
  </p>
  <p>
    <a href="https://github.com/ZetaoYang/ardour-build/actions?query=workflow%3AArdour%20Packaging%20for%20Linux">
      <img src="https://img.shields.io/github/workflow/status/ZetaoYang/ardour-build/Ardour%20Packaging%20for%20Linux?label=GNU%2FLinux" alt="GNU/Linux Build Status" />
    </a>
    <a href="https://github.com/ZetaoYang/ardour-build/actions?query=workflow%3AArdour%20Packaging%20for%20macOS">
      <img src="https://img.shields.io/github/workflow/status/ZetaoYang/ardour-build/Ardour%20Packaging%20for%20macOS?label=macOS" alt="macOS Build Status" />
    </a>
    <a href="https://github.com/ZetaoYang/ardour-build/actions?query=workflow%3AArdour%20Packaging%20for%20Windows">
      <img src="https://img.shields.io/github/workflow/status/ZetaoYang/ardour-build/Ardour%20Packaging%20for%20Windows?label=Windows" alt="Windows Build Status" />
    </a>
    <a href="https://github.com/ZetaoYang/ardour-build/releases">
      <img src="https://img.shields.io/github/downloads/ZetaoYang/ardour-build/total.svg?style=flat-square" alt="Total Downloads" />
    </a>
  </p>
</div>


## Packages

Now pre-built packages are available on:

|    OS     |       x86_64       |        x86         |       arm64        | armhf              |
| :-------: | :----------------: | :----------------: | :----------------: | ------------------ |
| GNU/Linux | :heavy_check_mark: |        :x:         | :heavy_check_mark: | :heavy_check_mark: |
|  Windows  | :heavy_check_mark: | :heavy_check_mark: |        :x:         | :x:                |
|   macOS   | :heavy_check_mark: |        :x:         |       :heavy_check_mark:         | :x:                |

**Note**

- Build them without `--freebie`. Namely, there will be no periodic silence after 10 minutes (Non-demo version).

## Build

The action is triggered by [workflows push paths event](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onpushpull_requestpaths) or [the repo's dispatch event](https://developer.github.com/v3/repos/#create-a-repository-dispatch-event).

For example, trigger building via repository dispatch event,

Get your own [personal access token](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line).

`POST /repos/:owner/:repo/dispatches`

Trigger with curl command, example,
```bash
curl -H "Accept: application/Accept: application/vnd.github.v3.full+json" \
-H "Authorization: token your-personal-token" \
--request POST \
--data '{\"event_type\": \"ardour-linux-pack\"}' \
https://api.github.com/repos/ZetaoYang/ardour-build/dispatches
```

or

```bash
curl -H "Accept: application/Accept: application/vnd.github.v3.full+json" \
-H "Authorization: token your-personal-token" \
--request POST \
--data '{\"event_type\": \"ardour-macos-pack\"}' \
https://api.github.com/repos/ZetaoYang/ardour-build/dispatches
```

or

```bash
curl -H "Accept: application/Accept: application/vnd.github.v3.full+json" \
-H "Authorization: token your-personal-token" \
--request POST \
--data '{\"event_type\": \"ardour-win-pack\", \"client_payload\": { \"version\": \"0.33.0\"}}' \
https://api.github.com/repos/ZetaoYang/ardour-build/dispatches
```

## Install

Simply download the latest version from github [release](https://github.com/ZetaoYang/ardour-build/releases). If you are Linux user, you can also install it from [flathub](https://flathub.org/apps/details/org.ardour.Ardour) made by https://github.com/flathub/org.ardour.Ardour/graphs/contributors.


## Acknowledgement

- Thanks to the [Ardour development](https://ardour.org/development.html) team for their effort.
- This project ["A Docker based build environment for cross compiling Ardour for windows using the official build infrastructure."](https://gitlab.com/mojofunk/ardour-ci-docker-jessie-mingw)  gave me a hint. It use official build scripts and patches, that is `git://git.ardour.org/ardour/ardour-build-tools.git`. This project also uses those scripts, but with a few changes.

## Links

- [Building Ardour on Linux](https://ardour.org/building_linux.html)
- [Building Ardour on MacOS](https://ardour.org/building_osx_native.html)
- [Build Dependencies](https://nightly.ardour.org/list.php#Build%20Dependencies)
- [Official nightly build](https://nightly.ardour.org/list.php)
- [Waf: The meta build system](https://waf.io)
- [Interfacing Linux: Compiling Ardour 6 On Debian 10](https://linuxgamecast.com/2020/06/interfacing-linux-compiling-ardour-6-on-debian)
- [Ardour Flatpak json](https://github.com/flathub/org.ardour.Ardour/blob/master/org.ardour.Ardour.json)
- [Ardour Fedora SPEC](https://src.fedoraproject.org/rpms/ardour6/blob/rawhide/f/ardour6.spec)
- [Ardour PKGBUILD](https://github.com/archlinux/svntogit-community/blob/packages/ardour/trunk/PKGBUILD)
- Another try, MSYS2 compile win64: 
	* https://github.com/defcronyke/ardour  
	* http://lalists.stanford.edu/lau/2016/10/0006.html   
	* https://github.com/Ardour/ardour/pull/278/files
-  [450+ pages Ardour 6 Manual PDF on github](https://github.com/derwok/manual/releases)
