
# CONTRIBUTING

This schema is developed by the [Cloud Work
Stream]([https://ga4gh.cloud](https://www.ga4gh.org/work_stream/cloud/)) of the
[Global Alliance for Genomics and Health](https://ga4gh.org).

## Semantic Versioning

The Task Execution Service (TES) API uses [semantic
versioning](https://semver.org/) for TES. Please consider that breaking changes
imply a new major version release, which is associated with considerable
administrative work and therefore happen only rarely.

## Suggesting Changes

Changes to TES can be initiated as
[**issues**](https://github.com/ga4gh/task-execution-schemas/issues) or
[**pull requests**](https://github.com/ga4gh/task-execution-schemas/pulls) to
allow for discussion and review. For considerable changes, we generally
recommend opening issues first in order to discuss scope and feasibility.

When creating pull requests, please do so from your own fork - even if you have
write access to the repository. In this way, when the main repository is forked
again, the new fork is created with a minimum of extraneous, volatile branches.

> To facilitate the review of external pull requests, users are encouraged to
> activate [**GitHub Actions**](https://github.com/features/actions) to monitor
> the build status of their fork. By following the documentation for [deployment
> to GitHub
> Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site),
> pushes to the forked repository will be viewable at
> `https://[user-or-org].github.io/task-execution-service/preview/<branch>/`,
> e.g.,:
> - `https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/docs/`
> - `https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/swagger-ui/`
> - `https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/swagger.json`
> - `https://[user-or-org].github.io/task-execution-schemas/preview/\<branch\>/swagger.yaml`

Providing this base URL in the pull request comment is appreciated, but not
required.

If a security vulnerability is identified with the specification, please send an
email to <mailto:security-notification@ga4gh.org> detailing your concerns.

For more information please refer to the [**governance
documentation**](GOVERNANCE.md).
