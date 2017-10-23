GA4GH Task Execution Schema (TES)
=================================

The Task Execution Schema (TES) project is an effort to define a standardized schema
and API for describing batch execution tasks. A task defines a set of input files,
a set of (Docker) containers and commands to run, a set of output files,
and some other logging and metadata.

The schema and APIs is defined [here](./task_execution.proto) in [protocol buffers](https://developers.google.com/protocol-buffers/). Clients may use JSON and REST to communicate
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
      "cpu_cores": 1,
      "ram_gb":    1.0,
      "size_gb":   100.0,
      "preemptible": false
    },
    "executors" : [
      {
        "image_name" : "ubuntu",
        "cmd" : ["md5sum", "/container/input"],
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
        "image_name" : "ubuntu",
        "cmd" : ["md5sum", "/container/input"],
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
large strings (stdout/err logging, input parameter contents).

```HTTP
GET /v1/tasks/task-1234?view=BASIC

{ "id": "task-1234", "state": "RUNNING", "name": "MD5 example", etc... }
```

The `full` view includes stdout/err logs and full input parameters:

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
