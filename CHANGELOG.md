# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).
This project tries to adhere to [Semantic Versioning](http://semver.org/).

---

## TODO
- Use Alpine (or Debian) instead of Ubuntu
- Use non-root user in the container
- Make the build script more roboust
- Make ARM version

---

## [Unreleased]
### Added

### Changed
- Build container now depends on awmyhr/builders:ubuntu
- Name changed from 'docker-soldo' to 'soldo-miner'

### Deprecated

### Removed

### Fixed

### Security

---

## [2.0.0] 2017-12-29
### Added
- Volumes defined (/root/.sld and /wallet)
- Exposed port 33711 (does 33712 need exposing as well?)

### Changed
- BREAKING CHANGE: the container now runs as the sldd command, you must provide
  paramaters.
- Streamlined layers in miner

### Fixed
- Fix steps for mounting wallet volume in README.md
- Need to set --no-cache=true

## [1.1.0] 2017-12-28
### Changed
- Build container now depends on awmyhr/builders:ubuntu
- Name changed from 'docker-soldo' to 'soldo-miner'

## [1.0.0] 2017-12-28
### Changed
- ADDRESS in run container set to '' to allow adding on commandline
- README updated

## [1.0.0-rc] 2017-12-28
### Added
- Dockerfile for build container
- Dockerfile for run container
- Build script
