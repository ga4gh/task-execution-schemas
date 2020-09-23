
# CONTRIBUTING

This schema is developed by the [Cloud Work Stream](https://ga4gh.cloud) of the [Global Alliance for Genomics and Health](https://ga4gh.org).

## Semantic Versioning

We use [semantic versioning](https://semver.org/) for TES, this will determine if your proposed changes impact a major or minor release.

## Suggesting Changes

Suggested changes to this schema can be initiated as [**Issues**](https://github.com/ga4gh/task-execution-schemas/issues) or [**Pull Requests**](https://github.com/ga4gh/task-execution-schemas/pulls) to allow for discussion and review.

Even those with write access to the main repository should in general create pull request branches within their own forks. This way when the main repository is forked again, the new fork is created with a minimum of extraneous volatile branches.

> To facilitate review of external pull requests, users are encouraged to activate [**Travis CI**](https://travis-ci.org/) to monitor the build status (documentation, Swagger UI) of their fork. By following the documentation for [deployment to GitHub Pages](https://docs.travis-ci.com/user/deployment/pages/) and adding a `$GITHUB_TOKEN` environment variable to their repo configuration, pushes to the forked repo should be viewable relative to `https://[user-or-org].github.io/workflow-execution-service-schemas/preview/<branch>/`:

+ https://[user-or-org].github.io/task-execution-service-schemas/preview/\<branch\>/docs/
+ https://[user-or-org].github.io/task-execution-service-schemas/preview/\<branch\>/swagger-ui/
+ https://[user-or-org].github.io/task-execution-service-schemas/preview/\<branch\>/swagger.json
+ https://[user-or-org].github.io/task-execution-service-schemas/preview/\<branch\>/swagger.yaml

> Providing this base URL in the pull request comment is appreciated, but not required.

If a security vulnerability is identified with the specification please send an email to security-notification@ga4gh.org detailing your concerns.

## Approving Changes

### pre-TES v1.0.0 / Testbed Voting Procedure
Changes for the release are to be approved by X developers -

### post TES v1.0.0 Voting Procedure
GA4GH has a number of Driver Projects. Each of those associated with the Cloud Work Stream will nominate a representative. None of these may vote against a proposed change for it to proceed.
