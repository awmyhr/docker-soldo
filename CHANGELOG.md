# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).
This project tries to adhere to [Semantic Versioning](http://semver.org/).

---

## TODO
- Use Alpine (or something equally small) instead of Debian:slim
- Use non-root user in the container
- Make the build script more roboust
- Make entrypoint script for a more 'user-friendly' interface
- Make ARM version

---

## [Unreleased]
### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

---

## [2.1.0] 2018-02-12
### Added

### Changed
- build.sh redesigned. Instead of creating a brand new container just for the
  build, we now pass current directory to builder and run a build script.
- New binaries will not be built if build.tar exists.
- re-platformed to Debian:slim
- pass flags to create a 'generic' (as gcc defines it) build

### Deprecated

### Removed

### Fixed
- Container will not be created if build.tar does not exist.
- Wrong container name used in README

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
