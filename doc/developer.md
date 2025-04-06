# For Developer 开发者文档

## Github Actions

本项目采用Github Actions 自动构建并发布，其中有两种方式触发发布Release

1. Commit Pre-Release: 在 commit 描述中，包含 `"[pre-release]"`字符串即可触发 预发布。（项目推送时会触发自动构建，以检测语法错误，使用 `"[skip ci]"` 跳过自动构建）
2. Tag Release: 创建 符合 `"v*"` 的Tag并推送，即可触发 正式发布.(`# Push events to matching v*, i.e. v1.0, v20.15.10)`

## Before Release 发布之前

1. 确保项目各项功能正常
2. 请更新修改 项目根目录下 `pubspec.yaml` 中的 `version` 字段，不进行更新可能导致其他设备安装新版本时无法安装的情况.
3. 若要升级小版本与大版本 如 v1.0 -> v1.1 或者 v1.0 -> v2.0，需要前往 `.github/flutter_build.yml` 修改flutter构建选项
