# yuru7-build-env

[yuru7氏](https://twitter.com/tawara_san) が[GitHub で公開している合成フォント](https://github.com/yuru7)のビルド環境っぽいものを構築しました。`./data` ディレクトリが `compose.yaml` があるディレクトリに作成され，Docker コンテナの `/data` にマウントされます。このディレクトリ内で適宜 `git clone` や `./make.sh` 実行をする想定です。

## ホスト環境

```
$ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS"
PRETTY_NAME="Ubuntu 22.04.2 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.2 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

$ docker version
Client: Docker Engine - Community
 Version:           24.0.2
 API version:       1.41 (downgraded from 1.43)
 Go version:        go1.20.4
 Git commit:        cb74dfc
 Built:             Thu May 25 21:51:00 2023
 OS/Arch:           linux/amd64
 Context:           default

Server:
 Engine:
  Version:          20.10.24
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.20.4
  Git commit:       5d6db84
  Built:            Wed May 24 23:31:22 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v1.6.20
  GitCommit:        2806fc1057397dbaeefbea0e4e17bddfbd388f38
 runc:
  Version:          1.1.5
  GitCommit:
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

$ docker compose version
Docker Compose version v2.18.1
```

