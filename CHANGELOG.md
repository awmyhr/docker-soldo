# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).
This project tries to adhere to [Semantic Versioning](http://semver.org/).

---

## TODO
- Use Alpine instead of Ubuntu
- Use non-root user in the container
- Expose other sldd paramaters as env vars
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

## [1.0.0] 2017-12-28
### Changed
- ADDRESS in run container set to '' to allow adding on commandline
- README updated

## [1.0.0-rc] 2017-12-28
### Added
- Dockerfile for build container
- Dockerfile for run container
- Build script
