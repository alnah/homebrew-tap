# alnah's Homebrew Tap

My Homebrew repository for distributing and sharing my tools.

## Install the Tap

```bash
brew tap alnah/tap
```

## Install a Package

### Formulae

```bash
brew install alnah/tap/<name>
```

Current formulae:

- `picoloom` - Markdown-to-PDF CLI powered by headless Chrome

Example:

```bash
brew install alnah/tap/picoloom
```

### Casks

```bash
brew install --cask alnah/tap/<name>
```

Current casks:

- none yet

## Update Installed Packages

```bash
brew update
brew upgrade
```

Update a single package:

```bash
brew upgrade alnah/tap/picoloom
```

## Uninstall

```bash
brew uninstall alnah/tap/<formula>
brew uninstall --cask alnah/tap/<cask>
```

## Repository Layout

- `Formula/` contains command-line tools and packages installed with `brew install`
- `Casks/` contains macOS apps installed with `brew install --cask`

## Create a New Formula

1. Add a new file in `Formula/<name>.rb`
2. Define the package metadata: `desc`, `homepage`, `url`, `sha256`, `license`
3. Add the install logic and a small `test do` block
4. Validate locally with `brew audit --strict alnah/tap/<name>` and `brew test alnah/tap/<name>`

## Create a New Cask

1. Add a new file in `Casks/<name>.rb`
2. Define the app metadata: `version`, `sha256`, `url`, `name`, `desc`, `homepage`
3. Add the install target such as `app`, `pkg`, or `binary`
4. Validate locally with `brew audit --cask --strict alnah/tap/<name>`

## Update a Formula or Cask

1. Update the version
2. Update the download URL if needed
3. Recompute and replace the `sha256`
4. Re-run `brew audit` and `brew test`

## Notes

- The GitHub repository is named `homebrew-tap`, but the Homebrew tap name is `alnah/tap`
- Use `brew info alnah/tap/<name>` for package-specific caveats and metadata
