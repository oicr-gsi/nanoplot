# nanoplot

Workflow to run Nanoplot (Plotting tool for long read sequencing data and alignments)

## Overview

## Dependencies

* [NanoPlot](https://github.com/wdecoster/NanoPlot)


## Usage

### Cromwell
```
java -jar cromwell.jar run nanoplot.wdl --inputs inputs.json
```

### Inputs

#### Required workflow parameters:
Parameter|Value|Description
---|---|---
`summaryFile`|File|Input summary file path produced by guppy


#### Optional workflow parameters:
Parameter|Value|Default|Description
---|---|---|---
`outputFileNamePrefix`|String|basename(summaryFile,".txt")|Variable used to set the outputfile name
`additionalParameters`|String?|None|Additional parameters to be added to the nanoplot command


#### Optional task parameters:
Parameter|Value|Default|Description
---|---|---|---
`generateReports.nanoplot`|String|"NanoPlot"|NanoPlot module name to use.
`generateReports.outputPath`|String|"./output"|The output directory of the files in nanoplot
`generateReports.modules`|String|"nanoplot/1.27.0"|Environment module names and version to load (space separated) before command execution.
`generateReports.memory`|Int|16|Memory (in GB) allocated for job.


### Outputs

Output | Type | Description
---|---|---
`npOutput`|File|zipped output folder of nanoplot data


## Niassa + Cromwell

This WDL workflow is wrapped in a Niassa workflow (https://github.com/oicr-gsi/pipedev/tree/master/pipedev-niassa-cromwell-workflow) so that it can used with the Niassa metadata tracking system (https://github.com/oicr-gsi/niassa).

* Building
```
mvn clean install
```

* Testing
```
mvn clean verify -Djava_opts="-Xmx1g -XX:+UseG1GC -XX:+UseStringDeduplication" -DrunTestThreads=2 -DskipITs=false -DskipRunITs=false -DworkingDirectory=/path/to/tmp/ -DschedulingHost=niassa_oozie_host -DwebserviceUrl=http://niassa-url:8080 -DwebserviceUser=niassa_user -DwebservicePassword=niassa_user_password -Dcromwell-host=http://cromwell-url:8000
```

## Support

For support, please file an issue on the [Github project](https://github.com/oicr-gsi) or send an email to gsi@oicr.on.ca .

_Generated with wdl_doc_gen (https://github.com/oicr-gsi/wdl_doc_gen/)_
