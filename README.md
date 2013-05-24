# coffer standalone server

This is the standalone version of coffer that allows you to launch a
coffer instance without other refuge tools.

## Requirements

- Erlang R15 or sup (R16b recommanded)

## Installation

Installation is pretty simple. Just run the command line:

    $ make
    $ make rel

and it will generate a couch folder in rel/coffer. This release is
fully relocatable, so you can put it where you want on your system.

You can then set soe default storage by editing the file `sys.config`:


    $ more rel/coffer/releases/1/sys.config 
    [

     %%
     {coffer, [
        {storages, [
            {<<"default">>, coffer_storage_localdisk, [
                {path, "/home/benoitc/files"}
            ]}
        ]}
    ]},


## Available storages:

* **coffer_storage_ets**: Storage in memory. 

Params:
- name: Name of the ets

* **coffer_storage_localdisk**: Storage in a folder

Params:
- path: path ehere to store the files


Example of usage:

    $ curl -XPUT http://localhost:8080/default/hashtype-test12345 -d"hello world"
    {
      "received": [
        {
          "blobRef": "hashtype-test12345",
          "size": 11
        }
      ]
    }
    $ curl -XGET http://localhot:8080/default
    {
      "container": {
        "name": "default",
        "blobs": [
          {
            "blobRef": "hashtype-test12345",
            "size": 11
          }
        ]
      }
    }

    $ curl -XGET http://localhot:8080/default/hashtype-test12345
    hello world

    $ ls ~/files
    hashtype
    $ ls ~/files/hashtype/t/e/s/t12345 
    /home/benoitc/files/hashtype/t/e/s/t12345


