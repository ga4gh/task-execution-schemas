
# CONTRIBUTING

This schema is developed by the [Cloud Work Stream](https://ga4gh.cloud) of the [Global Alliance for Genomics and Health](https://ga4gh.org).

## Semantic Versioning

We use [semantic versioning](https://semver.org/) for TES, this will determine if your proposed changes impact a major or minor release.

## Suggesting Changes

Suggested changes to this schema can be initiated as [**Issues**](https://github.com/ga4gh/task-execution-schemas/issues) or [**Pull Requests**](https://github.com/ga4gh/task-execution-schemas/pulls) to allow for discussion and review.

Even those with write access to the main repository should in general create pull request branches within their own forks. This way when the main repository is forked again, the new fork is created with a minimum of extraneous volatile branches.


> To facilitate the review of external pull requests, users are encouraged to activate [**GitHub Actions**](https://github.com/features/actions) to monitor the build status (documentation, Swagger UI) of their fork. By following the documentation for [deployment to GitHub Pages](https://docs.github.com/en/actions/publishing-packages/deploying-to-github-pages) and adding a `$GITHUB_TOKEN` environment variable to their repository configuration, pushes to the forked repository will be viewable at `https://[user-or-org].github.io/workflow-execution-service-schemas/preview/<branch>/`:


This version replaces references to Travis CI with GitHub Actions while maintaining the original meaning and intent.

+ https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/docs/
+ https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/swagger-ui/
+ https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/swagger.json
+ https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/swagger.yaml

> Providing this base URL in the pull request comment is appreciated, but not required.

If a security vulnerability is identified with the specification please send an email to security-notification@ga4gh.org detailing your concerns.

## Approving Changes

### pre-TES v1.0.0 / Testbed Voting Procedure
Changes for the release are to be approved by 2 TES specification leads.

### post TES v1.0.0 Voting Procedure
The post v1.0.0 voting group include stakeholders, such as server and client implementors.
The membership of this group will be established as part of the v1.0.0 release.

For more information please see the [Governance](GOVERNANCE.md) documentation.
