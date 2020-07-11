<img src="https://www.ga4gh.org/wp-content/themes/ga4gh-theme/gfx/GA-logo-horizontal-tag-RGB.svg" alt="GA4GH Logo" style="width: 400px;"/>

Task Execution Service (TES) API
======================================
<sup>`master` branch status: </sup>[![Build Status](https://travis-ci.org/ga4gh/task-execution-schemas.svg?branch=master)](https://travis-ci.org/ga4gh/task-execution-schemas?branch=master)
<a href="https://raw.githubusercontent.com/ga4gh/task-execution-schemas/master/openapi/task_execution.swagger.yaml"><img src="http://online.swagger.io/validator?url=https://raw.githubusercontent.com/ga4gh/task-execution-schemas/master/openapi/task_execution.swagger.yaml" alt="Swagger Validator" height="20em" width="72em"></A>

The [Global Alliance for Genomics and Health](http://genomicsandhealth.org/) is an international coalition, formed to enable the sharing of genomic and clinical data.

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

TES Compliant Implementations
==============================
- [Funnel](https://ohsu-comp-bio.github.io/funnel/)
- [TESK](https://github.com/EMBL-EBI-TSI/TESK)
- [tes-azure](https://github.com/microsoft/tes-azure)


TES Service Examples
==============================

The schema and APIs is defined [here](./openapi/task_execution.swagger.yaml) in [Open Api Specification 2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md) (e.g [Swagger](https://swagger.io/specification/v2/)). Clients may use JSON and REST to communicate
with a service implementing the TES API.


Create a task
---------------------------------

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


Get a task
--------------------------------

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

List tasks
------------------------------------

To list tasks:

```HTTP
GET /v1/tasks

{ "tasks": [{ "id": "task-1234", "state": "RUNNING"}, etc...] }
```

Similar to getting a task by ID, you may change the task view:
```HTTP
GET /v1/tasks?view=BASIC
```


Cancel a task
-------------------------------------

To cancel a task, send an HTTP POST to the cancel endpoint:
```HTTP
POST /v1/tasks/task-1234:cancel
```
