# Kyan

## How to work with our project?

- ### Run app
  `flutter run`
- ### Update store
  ` flutter packages pub run build_runner watch --delete-conflicting-outputs`
- ### Update l10n
  ` flutter pub run intl_utils:generate`

## How to `release -> test` app

### 1. Create tag

`git tag v*.*.*`

- Example: `git tag v0.0.002`

### 2. Push tag

`git push origin --tags`

### 3. Download apk test

1. Vào link:
   `https://github.com/TDSof/Trygo-fe/releases/tag/*`

- Example: https://github.com/TDSof/Trygo-fe/releases/tag/v0.0.002

Hoặc :

![This is a alt text.](/guides/release.png "Release.")

2. Download and install file : `app-release.apk`

![This is a alt text.](/guides/assets.png "Release.")
