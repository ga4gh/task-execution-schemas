<img src="https://www.ga4gh.org/wp-content/themes/ga4gh/dist/assets/svg/logos/logo-full-color.svg" alt="GA4GH Logo" style="width: 400px;"/>

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![release_badge](https://img.shields.io/github/v/tag/ga4gh/task-execution-schemas?label=latest%20release&logo=github&style=flat)](https://github.com/ga4gh/task-execution-schemas/releases)

`main` branch status

| Build  | CI | Open API Validator |
|---|---|---|
| [![Build Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/ga4gh/task-execution-schemas/actions/workflows/build.yml?query=branch%3Amain) | [![CI Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/ga4gh/task-execution-schemas/actions/workflows/ci.yml?query=branch%3Amain) | [![Swagger Validator](https://img.shields.io/swagger/valid/3.0?specUrl=https%3A%2F%2Fraw.githubusercontent.com%2Fga4gh%2Ftask-execution-schemas%2Fmain%2Fopenapi%2Ftask_execution_service.openapi.yaml&label=OpenAPI)](https://editor.swagger.io/?url=https://raw.githubusercontent.com/ga4gh/task-execution-schemas/refs/heads/main/openapi/task_execution_service.openapi.yaml) |

`develop` branch status

| Build  | CI | Open API Validator |
|---|---|---|
| [![Build Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/build.yml/badge.svg?branch=develop)](https://github.com/ga4gh/task-execution-schemas/actions/workflows/build.yml?query=branch%3Adevelop) | [![CI Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/ga4gh/task-execution-schemas/actions/workflows/ci.yml?query=branch%3Adevelop) | [![Swagger Validator](https://img.shields.io/swagger/valid/3.0?specUrl=https%3A%2F%2Fraw.githubusercontent.com%2Fga4gh%2Ftask-execution-schemas%2Fdevelop%2Fopenapi%2Ftask_execution_service.openapi.yaml&label=OpenAPI)](https://editor.swagger.io/?url=https://raw.githubusercontent.com/ga4gh/task-execution-schemas/refs/heads/develop/openapi/task_execution_service.openapi.yaml) |

Task Execution Service (TES) API
================================

This repository is the home for the schema of the Task Execution Service (TES)
API defined by the[Cloud Work Stream](https://www.ga4gh.org/work_stream/cloud/)
of the [Global Alliance for Genomics and Health (GA4GH)](https://ga4gh.org/).
The goal of the API standard is to provide a uniform way to executing batch
computing tasks.

[GA4GH](https://ga4gh.org/) is an international coalition, formed to enable the
sharing and processing of genomic data.

The [Cloud Work Stream](https://www.ga4gh.org/work_stream/cloud/) helps the
genomics and health communities take full advantage of modern cloud
environments. Our initial focus is on “bringing the algorithms to the data”, by
creating standards for defining, sharing, and executing portable workflows.

We work with platform development partners and industry leaders to develop
standards that will facilitate interoperability.

What is TES?
============

The Task Execution Service (TES) API is an effort to define a standardized
schema and API for describing batch execution tasks. A task defines a set of
commands to run, a set of (Docker) containers to run them _in_, sets of input
and output files, required resources, as well as some other metadata, e.g., for
capturing provenance information.

API Definition
--------------

See the human-readable [**reference
documentation**](https://ga4gh.github.io/task-execution-schemas/docs/).

> The documentation hosted at <https://ga4gh.github.io/task-execution-schemas>
> reflects the latest official API release from the `main` branch. To explore
> the documentation from a development branch, append
> `preview/<branch-name>/docs/` to the base URL. For example, to view the
> documentation for the latest **development version of the specification**,
> visit <https://ga4gh.github.io/task-execution-schemas/preview/develop/docs/>.

You can also examine the specification in the [**Swagger
Editor**](https://editor.swagger.io/?url=https://raw.githubusercontent.com/ga4gh/task-execution-schemas/refs/heads/main/openapi/task_execution_service.openapi.yaml).  

> If you want to explore a version from a development branch, please load the
> corresponding specification file (in
> `openapi/task_execution_service.openapi.yaml`) manually into the [Swagger
> Editor](https://editor.swagger.io/).

TES Compliant Implementations
-----------------------------

In alignment with GA4GH policies and regulations, security reviews are conducted
for each major version release of the API. However, **no security guarantees are
provided for any implementation of the API, including those linked from this
page or the associated documentation**. Users are advised to proceed at their
own risk and should arrange for a security audit of their application to ensure
compliance with relevant regulatory and security standards, particularly when
handling personal data.

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

> Compatibility is assumed based on available documentation and limited tests
> performed on latest versions of implementations available in December 2020.
> Information may be outdated.

|               | cwl-tes       | Cromwell  | Nextflow |
| -----------   | ------------- | --------- | ---------|
| **Funnel**    | [Compatible](https://github.com/ohsu-comp-bio/cwl-tes) | Compatible | [Compatible](https://www.nextflow.io/docs/latest/executor.html#ga4gh-tes) |
| **TESK**      | [Compatible](https://github.com/ohsu-comp-bio/cwl-tes/pull/25) | [Compatible](https://cromwell.readthedocs.io/en/stable/backends/TES/) | [Compatible](https://github.com/EMBL-EBI-TSI/tesk-core/pull/19) |
| **TES Azure** | Not tested | [Compatible](https://github.com/microsoft/CromwellOnAzure) | [Compatible](https://www.nextflow.io/docs/stable/executor.html#ga4gh-tes) |


TES Service Examples
--------------------

The API specification is available
[here](openapi/task_execution_service.openapi.yaml) in [OpenAPI
v3.0.1](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md).
Clients may use JSON and REST to communicate with a service implementing the TES
API.

> In the below example, the indicated endpoints only 

### Creating a task

Here's an example of a complete task message, defining a task which calculates
an MD5 checksum on an input file and uploads the output:

```JSON
{
  "name": "MD5 example",
  "description": "Task which runs md5sum on the input file.",
  "tags": {
      "custom-tag": "tag-value"
  },
  "inputs": [
      {
          "name": "infile",
          "description": "md5sum input file",
          "url": "/path/to/input_file",
          "path": "/container/input",
          "type": "FILE"
      }
  ],
  "outputs": [
      {
          "name": "outfile",
          "url": "/path/to/output_file",
          "path": "/container/output"
      }
  ],
  "resources": {
      "cpuCores": 1,
      "ramGb": 1,
      "diskGb": 100,
      "preemptible": false
  },
  "executors": [
      {
          "image": "ubuntu",
          "command": [
              "md5sum",
              "/container/input"
          ],
          "stdout": "/container/output",
          "stderr": "/container/stderr",
          "workdir": "/tmp"
      }
  ]
}
```

A minimal version of the same task, including only the required fields looks
like:

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

To create the task, send an HTTP `POST` request to the `/tasks` endpoint:

```HTTP
POST /ga4gh/tes/v1/tasks
```

The response indicates an identifier for the created task resource:

```JSON
{ 
  "id": "task-1234" 
}
```

### Fetching a task

To get a task by its identifier, send an HTTP `GET` request to the `/tasks/{id}`
endpoint:

```HTTP
GET /ga4gh/tes/v1/tasks/task-1234
```

The default minimal response will include the task state:

```JSON
{ 
  "id": "task-1234",
  "state": "RUNNING" 
}
```

To get more information, you can change the task view using the `view` URL query
parameter.

The `BASIC` view will include all task fields except a few which might be large
strings (stdout/stderr, system logging, input parameter contents):

```HTTP
GET /ga4gh/tes/v1/tasks/task-1234?view=BASIC
```

```JSON
{
  "id": "task123",
  "name": "Sample Task",
  "description": "This is a sample task description.",
  "state": "COMPLETED",
  "inputs": [
      {
          "name": "infile",
          "description": "Input file for the task.",
          "url": "/path/to/input_file",
          "path": "/container/input",
          "type": "FILE"
      }
  ],
  "outputs": [
      {
          "name": "outfile",
          "url": "/path/to/output_file",
          "path": "/container/output"
      }
  ],
  "resources": {
      "cpuCores": 1,
      "ramGb": 2.0,
      "diskGb": 10.0,
      "preemptible": false
  },
  "executors": [
      {
          "image": "ubuntu:latest",
          "command": ["command", "arg1", "arg2"],
          "stdout": "/container/output",
          "stderr": "/container/stderr",
          "workdir": "/tmp"
      }
  ],
  "created": "2024-10-24T12:00:00Z",
  "updated": "2024-10-24T12:30:00Z"
}
```

The `FULL` view includes stdout/stderr, system logs and full input parameters:

```HTTP
GET /ga4gh/tes/v1/tasks/task-1234?view=FULL
```

```JSON
{
  "id": "job-0012345",
  "state": "COMPLETE",
  "name": "MD5 Checksum Task",
  "description": "This task computes the MD5 checksum of the input file.",
  "inputs": [
    {
      "url": "s3://my-object-store/file1",
      "path": "/data/file1"
    }
  ],
  "outputs": [
    {
      "path": "/data/outfile",
      "url": "s3://my-object-store/outfile-1",
      "type": "FILE"
    }
  ],
  "resources": {
    "cpu_cores": 4,
    "preemptible": false,
    "ram_gb": 8,
    "disk_gb": 40,
    "zones": "us-west-1",
    "backend_parameters": {
      "VmSize": "Standard_D64_v3"
    },
    "backend_parameters_strict": false
  },
  "executors": [
    {
      "image": "ubuntu:20.04",
      "command": [
        "/bin/md5",
        "/data/file1"
      ],
      "workdir": "/data/",
      "stdin": "/data/file1",
      "stdout": "/tmp/stdout.log",
      "stderr": "/tmp/stderr.log",
      "ignore_error": true
    }
  ],
  "volumes": [
    "/vol/A/"
  ],
  "tags": {
    "WORKFLOW_ID": "cwl-01234",
    "PROJECT_GROUP": "alice-lab"
  },
  "logs": [
    {
      "logs": [
        {
          "start_time": "2020-10-02T10:00:00-05:00",
          "end_time": "2020-10-02T11:00:00-05:00",
          "stdout": "MD5 checksum calculation completed successfully.",
          "stderr": "",
          "exit_code": 0
        }
      ],
      "metadata": {
        "host": "worker-001",
        "slurmm_id": 123456
      },
      "start_time": "2020-10-02T10:00:00-05:00",
      "end_time": "2020-10-02T11:00:00-05:00",
      "outputs": [
        {
          "url": "s3://my-object-store/outfile-1",
          "path": "/data/outfile",
          "size_bytes": 1024
        }
      ],
      "system_logs": [
        "Task executed successfully without any issues."
      ]
    }
  ],
  "creation_time": "2020-10-02T10:00:00-05:00"
}
```

### Listing tasks

To list all available tasks, send an HTTP `GET` requests to the `/tasks`
endpoint:

```HTTP
GET /ga4gh/tes/v1/tasks
```

```JSON
{
  "tasks": [
    {
      "id": "job-0012345",
      "state": "COMPLETE"
    },
    {
      "id": "job-0012346",
      "state": "RUNNING"
    },
    {
      "id": "job-0012347",
      "state": "FAILED"
    }
  ]
}
```

Similar to getting a task by ID, you may change the task view:

```HTTP
GET /ga4gh/tes/v1/tasks?view=BASIC
```

### Cancelling a task

To cancel a task, send an HTTP `POST` request to the `tasks/{id}:cancel`
endpoint:

```HTTP
POST /ga4gh/tes/v1/tasks/task-1234:cancel
```

How to Contribute Changes
-------------------------

### Community Contributions and Spec Advancement

The advancement of the GA4GH Task Execution Service (TES) API relies on active
community engagement and contributions. While submitting issues is an effective
way to report bugs or foster discussions about existing or proposed features, it
is important to note that these actions alone typically do not lead to
modifications in the specification. **The most effective method for implementing
changes is through the submission of a pull request (PR).** 

For detailed guidance on how to contribute, please refer to the
[Contributing](CONTRIBUTING.md) document.

If a security issue is identified with the specification, please send an email to
<mailto:security-notification@ga4gh.org> detailing your concerns.

### Governance

The development of the TES specification is entirely community driven. However,
development is overseen by a governance committee. For more information please
refer to the [**governance documentation**](GOVERNANCE.md).
