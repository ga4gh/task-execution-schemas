GA4GH Task Execution Schema (TES)
=================================

The Task Execution Schema (TES) project is an effort to define a standardized schema
and API for describing batch execution tasks. A task defines a set of input files,
a set of (Docker) containers and commands to run, a set of output files,
and some other logging and metadata.

The schema and APIs is defined [here](./task_execution.proto) in [protocol buffers](https://developers.google.com/protocol-buffers/). Clients may use JSON and REST to communicate
with a service implementing the TES API.

Here's an example task message, defining a task which calculates
an MD5 checksum on an input file and uploads output:
```JSON
{
    "name":        "MD5 example",
    "description": "Task which runs md5sum on the input file.",
    "project":     "tes-example-project-id",
    "tags": {
      "custom-tag": "tag-value",
    },
    "inputs": [
      {
        "name": "infile",
        "description": "md5sum input file",
        "url":  "/path/to/input_file",
        "path": "/container/input",
        "type": "FILE",
      }
    ],
    "outputs" : [
      {
        "url" :  "/path/to/output_file",
        "path" : "/container/output",
      }
    ],
    "resources" : {
      "cpu_cores": 1,
      "ram_gb":    1.0,
      "size_gb":   100.0,
      "preemptible": false,
    },
    "executors" : [
      {
        "image_name" : "ubuntu",
        "cmd" : ["md5sum", "/container/input"],
        "stdout" : "/container/output",
        "stderr" : "/container/stderr",
        "workdir": "/tmp",
      }
    ]
}
```

This message would be submitted via HTTP Post to `/v1/tasks`.  
The return value is a task ID:
```JSON
{ "id": "6E57CA6B-0BC7-44FB-BA2C-0CBFEC629C63" }
```

Then, the task and logs may be retrieve with a HTTP GET.  
`GET /v1/tasks/6E57CA6B-0BC7-44FB-BA2C-0CBFEC629C63
`
