<img src="https://www.ga4gh.org/wp-content/themes/ga4gh/dist/assets/svg/logos/logo-full-color.svg" alt="GA4GH Logo" style="width: 400px;"/>

![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg) [![release_badge](https://img.shields.io/github/v/tag/ga4gh/task-execution-schemas?label=latest%20release&logo=github&style=flat)](https://github.com/ga4gh/task-execution-schemas/releases)

`master` branch status

| Build  | CI  | Open API Validator |
|------------------------|-----------|--------------------|
| ![Build Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/build.yml/badge.svg?branch=master) | ![CI Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/ci.yml/badge.svg?branch=master) | [![Open API Validator](https://img.shields.io/badge/OpenAPI-Validator-blue)](http://online.swagger.io/validator?url=https://raw.githubusercontent.com/ga4gh/task-execution-schemas/master/openapi/task_execution_service.openapi.yaml) |

`develop` branch status

| Build  | CI  | Open API Validator |
|------------------------|-----------|--------------------|
| ![Build Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/build.yml/badge.svg?branch=develop) | ![CI Status](https://github.com/ga4gh/task-execution-schemas/actions/workflows/ci.yml/badge.svg?branch=develop) | [![Open API Validator](https://img.shields.io/badge/OpenAPI-Validator-blue)](http://online.swagger.io/validator?url=https://raw.githubusercontent.com/ga4gh/task-execution-schemas/develop/openapi/task_execution_service.openapi.yaml) |


Task Execution Service (TES) API
======================================

This repository is the home for the schema of the Task Execution Service (TES) API defined by the [Cloud Work Stream](https://www.ga4gh.org/work_stream/cloud/) of the [Global Alliance for Genomics and Health (GA4GH)](http://genomicsandhealth.org/). The goal of the API is to provide a standardized way to executing batch execution tasks.

[GA4GH](http://genomicsandhealth.org/) is an international coalition, formed to enable the sharing of genomic and clinical data.

Cloud Work Stream
-----------------

The [Cloud Work Stream](https://ga4gh.cloud) helps the genomics and health communities take full advantage of modern cloud environments. Our initial focus is on “bringing the algorithms to the data”, by creating standards for defining, sharing, and executing portable workflows.g

We work with platform development partners and industry leaders to develop standards that will facilitate interoperability.

What is TES?
============

The Task Execution Service (TES) API is an effort to define a standardized schema
and API for describing batch execution tasks. A task defines a set of input files,
a set of (Docker) containers and commands to run, a set of output files,
and some other logging and metadata.

API Definition
--------------

See the human-readable [Reference Documentation](https://ga4gh.github.io/task-execution-schemas/docs/).


You can also examine the specification in the [Swagger Editor](https://editor.swagger.io/?url=https://ga4gh.github.io/task-execution-schemas/openapi.yaml).  

*If you are using a version from a non-develop branch, please load the JSON manually.* You can preview the documentation from the [gh-openapi-docs](https://github.com/ga4gh/gh-openapi-docs) for the development branch [here](https://ga4gh.github.io/task-execution-schemas/preview/develop/docs/index.html).

All documentation and pages hosted at 'ga4gh.github.io/task-execution-schemas' reflect the latest API release from
the `master` branch. To monitor the latest development work, add 'preview/\<branch\>' to the URLs above (e.g., '
ga4gh.github.io/task-execution-schemas/preview/\<branch\>/docs'). To view the latest *stable*
development API specification, refer to the `develop` branch.


TES Compliant Implementations
------------------------------

In alignment with GA4GH policies and regulations, security reviews are conducted for each major version release of the API. However, **no security guarantees are provided for any implementation of the API, including those linked from this page or the associated documentation**. Users are advised to proceed at their own risk and should arrange for a security audit of their application to ensure compliance with relevant regulatory and security standards, particularly when handling personal data.

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
```

The return value is a task ID.
```JSON
{ 
  "id": "task-1234" 
}
```


### Get a task


To get a task by ID:

```HTTP
GET /v1/tasks/task-1234
```

The return value will be a minimal description of the task state.

```JSON
{ 
  "id": "task-1234",
  "state": "RUNNING" 
}
```

To get more information, you can change the task view using the `view` URL query parameter.

The `basic` view will include all task fields except a few which might be
large strings (stdout/err/system logging, input parameter contents).

```HTTP
GET /v1/tasks/task-1234?view=BASIC
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
The `full` view includes stdout/err/system logs and full input parameters:

```HTTP
GET /v1/tasks/task-1234?view=FULL
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

### List tasks


To list tasks:

```HTTP
GET /v1/tasks
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
GET /v1/tasks?view=BASIC
```


### Cancel a task


To cancel a task, send an HTTP POST to the cancel endpoint:
```HTTP
POST /v1/tasks/task-1234:cancel
```


How to Contribute Changes
-------------------------


### Community Contributions and Spec Advancement

The advancement of the GA4GH Task Execution Schema (TES) relies on active community engagement and contributions. While submitting issues is an effective way to report bugs or foster discussions about existing or proposed features, it is important to note that these actions alone do not lead to modifications in the specification. The most effective method for implementing changes is through the submission of a pull request (PR). 

For detailed guidance on how to contribute, please refer to the [Contributing](CONTRIBUTING.md) document.

If a security issue is identified with the specification, please send an email to security-notification@ga4gh.org detailing your concerns.


### Governance

The TES specification is entirely community driven, however it is overseen by a governance committee. For more information please see the [Governance](GOVERNANCE.md) documentation.
