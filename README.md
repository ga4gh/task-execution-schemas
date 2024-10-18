<img src="https://www.ga4gh.org/wp-content/themes/ga4gh/dist/assets/svg/logos/logo-full-color.svg" alt="GA4GH Logo" style="width: 400px;"/>

![release_badge](https://img.shields.io/github/v/tag/ga4gh/task-execution-schemas)


Task Execution Service (TES) API
======================================

This repository is the home for the schema for the GA4GH Task Execution API. The Goal of the API is to provide a standardized way to executing batch execution tasks.

The [Global Alliance for Genomics and Health](http://genomicsandhealth.org/) is an international coalition, formed to enable the sharing of genomic and clinical data.

Cloud Work Stream
-----------------

The [Cloud Work Stream](https://ga4gh.cloud) helps the genomics and health communities take full advantage of modern
cloud environments.
Our initial focus is on “bringing the algorithms to the data”, by creating standards for defining, sharing, and
executing portable workflows.

We work with platform development partners and industry leaders to develop standards that will facilitate
interoperability.

Cloud Work Stream
-----------------

The [Cloud Work Stream](https://ga4gh.cloud) helps the genomics and health communities take full advantage of modern cloud environments.
Our initial focus is on “bringing the algorithms to the data”, by creating standards for defining, sharing, and executing portable workflows.

We work with platform development partners and industry leaders to develop standards that will facilitate interoperability.

What is TES?
============

The Task Execution Service (TES) API is an effort to define a standardized schema
and API for describing batch execution tasks. A task defines a set of input files,
a set of (Docker) containers and commands to run, a set of output files,
and some other logging and metadata.

API Definition
--------------

See the human-readable [Reference Documentation](https://ga4gh.github.io/task-execution-schemas/docs/)
You can also explore the specification in
the [Swagger Editor](https://editor.swagger.io/?url=https://ga4gh.github.io/task-execution-schemas/openapi.yaml)**
*Manually load the JSON if working from a non-develop branch version.* Preview documentation from
the [gh-openapi-docs](https://github.com/ga4gh/gh-openapi-docs) for the development
branch [here](https://ga4gh.github.io/task-execution-schemas/preview/develop/docs/index.html)

> All documentation and pages hosted at 'ga4gh.github.io/task-execution-schemas' reflect the latest API release from
> the `master` branch. To monitor the latest development work, add 'preview/\<branch\>' to the URLs above (e.g., '
> ga4gh.github.io/task-execution-schemas/preview/\<branch\>/docs'). To view the latest *stable*
> development API specification, refer to the `develop` branch.


TES Compliant Implementations
------------------------------

> A stand-alone security review has been performed on the API. Nevertheless, any implementation that is linked to from the documentation accompanying the API is done so without any security guarantees. If you integrate this code into your application it is AT YOUR OWN RISK AND RESPONSIBILITY to arrange for an audit to ensure compliance with any applicable regulatory and security requirements, especially where personal data may be at issue.

### Client
- [cwl-tes](https://github.com/ohsu-comp-bio/cwl-tes)
- [Cromwell](https://cromwell.readthedocs.io/en/stable/backends/TES/)
- [ELIXIR Cloud Components](https://elixir-cloud-components.vercel.app/)
- [py-tes](https://github.com/ohsu-comp-bio/py-tes)
- [Nextflow](https://www.nextflow.io/docs/stable/executor.html#ga4gh-tes)
- [Snakemake](https://snakemake.readthedocs.io/en/stable/executing/cloud.html#executing-a-snakemake-workflow-via-ga4gh-tes)
- [Toil](https://toil.readthedocs.io/en/latest/)
- [St. Jude Rust Labs](https://github.com/stjude-rust-labs/tes)



### Server
- [Funnel](https://ohsu-comp-bio.github.io/funnel/)
- [TESK](https://github.com/EMBL-EBI-TSI/TESK)
- [TES Azure](https://github.com/microsoft/ga4gh-tes)
- [Pulsar](https://pulsar.readthedocs.io/)
- [proTES](https://github.com/elixir-cloud-aai/proTES)

### Compatibility Matrix

> Compatibility is assumed based on available documentation and limited tests performed on latest versions of implementations available as of December 2020.

|               | cwl-tes       | Cromwell  | Nextflow |
| -----------   | ------------- | --------- | ---------|
| **Funnel**    | [Compatible](https://github.com/ohsu-comp-bio/cwl-tes) | Compatible | [Compatible](https://www.nextflow.io/docs/latest/executor.html#ga4gh-tes) |
| **TESK**      | [Compatible](https://github.com/ohsu-comp-bio/cwl-tes/pull/25) | [Compatible](https://cromwell.readthedocs.io/en/stable/backends/TES/) | [Compatible](https://github.com/EMBL-EBI-TSI/tesk-core/pull/19) |
| **TES Azure** | Not tested | [Compatible](https://github.com/microsoft/CromwellOnAzure) | [Compatible](https://www.nextflow.io/docs/stable/executor.html#ga4gh-tes) |


TES Service Examples
------------------------------

The schema and APIs is defined [here](openapi/task_execution_service.openapi.yaml) in [Open Api Specification 3.0.1](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md). Clients may use JSON and REST to communicate
with a service implementing the TES API.


### Create a task


Here's an example of a complete task message, defining a task which calculates
an MD5 checksum on an input file and uploads the output:
```JSON
{
    "name":        "MD5 example",
    "description": "Task which runs md5sum on the input file.",
    "tags": {
      "custom-tag": "tag-value"
    },
    "inputs": [
      {
        "name": "infile",
        "description": "md5sum input file",
        "url":  "/path/to/input_file",
        "path": "/container/input",
        "type": "FILE"
      }
    ],
    "outputs" : [
      {
        "url" :  "/path/to/output_file",
        "path" : "/container/output"
      }
    ],
    "resources" : {
      "cpuCores": 1,
      "ramGb":    1.0,
      "diskGb":   100.0,
      "preemptible": false
    },
    "executors" : [
      {
        "image" : "ubuntu",
        "command" : ["md5sum", "/container/input"],
        "stdout" : "/container/output",
        "stderr" : "/container/stderr",
        "workdir": "/tmp"
      }
    ]
}
```

A minimal version of the same task, including only the required fields looks like:
```JSON
{
    "inputs": [
      {
        "url":  "/path/to/input_file",
        "path": "/container/input"
      }
    ],
    "outputs" : [
      {
        "url" :  "/path/to/output_file",
        "path" : "/container/output"
      }
    ],
    "executors" : [
      {
        "image" : "ubuntu",
        "command" : ["md5sum", "/container/input"],
        "stdout" : "/container/output"
      }
    ]
}
```

To create the task, send an HTTP POST request:
```HTTP
POST /v1/tasks

{ "id": "task-1234" }
```

The return value is a task ID.


### Get a task


To get a task by ID:

```HTTP
GET /v1/tasks/task-1234

{ "id": "task-1234", "state": "RUNNING" }
```

The return value will be a minimal description of the task state.

To get more information, you can change the task view using the `view` URL query parameter.

The `basic` view will include all task fields except a few which might be
large strings (stdout/err/system logging, input parameter contents).

```HTTP
GET /v1/tasks/task-1234?view=BASIC

{ "id": "task-1234", "state": "RUNNING", "name": "MD5 example", etc... }
```

The `full` view includes stdout/err/system logs and full input parameters:

```HTTP
GET /v1/tasks/task-1234?view=FULL

{ "id": "task-1234", "state": "RUNNING", "name": "MD5 example",
  "logs": [{ "stdout": "stdout content..." }], etc... }
```

### List tasks


To list tasks:

```HTTP
GET /v1/tasks

{ "tasks": [{ "id": "task-1234", "state": "RUNNING"}, etc...] }
```

Similar to getting a task by ID, you may change the task view:
```HTTP
GET /v1/tasks?view=BASIC
```


### Cancel a task


To cancel a task, send an HTTP POST to the cancel endpoint:
```HTTP
POST /v1/tasks/task-1234:cancel
```

Possible Future Enhancements
----------------------------

* Integrate with GA4GH DRS to resolve input data source (possibly support for DRS URIs as permissible values of input URLs).
* Integrate with GA4GH TRS to resolve container images (possibly support for TRS URIs as permissible values of executor image names).


How to Contribute Changes
-------------------------

See [CONTRIBUTING.md](CONTRIBUTING.md).

If a security issue is identified with the specification, please send an email to security-notification@ga4gh.org detailing your concerns.
