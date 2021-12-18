# UI LMS Toolbox

## What is this?

A toolbox for working with University of Isfahan Learning Managemet System.

## How it works?

### Get recorded videos links

first make `get_links.sh` executable:

```bash
chmod +x ./get_links.sh
```

then start it with this parameters:

```bash
./get_links.sh <username> <password> <group id> <destination file path>
```

`group id` is ID of class that can be seen in the link of class:

![group id example](https://github.com/thantez/ui_lms_toolbox/blob/main/group_id.png?raw=true)

Currently it works just on UNIX systems.

## Current features

- get recorded videos links of class
