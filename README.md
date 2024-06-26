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

Output | Type | Description | Labels
---|---|---|---
`npOutput`|File|zipped output folder of nanoplot data.|vidarr_label: npOutput


## Commands
 
 This section lists command(s) run by nanoplot workflow
 
 * Running nanoplot
 
 ```
     nanoplot --summary SUMMARY_FILE -o OTPUT_PATH ADDITIONAL_PARAMETERS
     zip -r OUTPUT_PREFIX_nanoplot.zip OUTPUT_PATH
 ```
 
 ## Support

For support, please file an issue on the [Github project](https://github.com/oicr-gsi) or send an email to gsi@oicr.on.ca .

_Generated with generate-markdown-readme (https://github.com/oicr-gsi/gsi-wdl-tools/)_
