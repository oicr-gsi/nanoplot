version 1.0

workflow nanoplot {
    input {
        File summaryFile
        String outputFileNamePrefix
    }
    parameter_meta {
        summaryFile: "Input summary file path produced by guppy"
        outputFileNamePrefix: "Variable used to set the outputfile name"
    }

    meta {
        author: "Matthew Wong"
        email: "m2wong@oicr.on.ca"
        description: "Workflow to run Nanoplot (Plotting tool for long read sequencing data and alignments)"
        dependencies: [{
            name: "NanoPlot",
            url: "https://github.com/wdecoster/NanoPlot"
        }]
    }
    call generateReports {
        input:
            summaryFile = summaryFile,
            outputFileNamePrefix = outputFileNamePrefix
    }
    output {
        File npOutput = generateReports.npOutput
    }
}

task generateReports {
    input {
        String? nanoplot = "NanoPlot"
        String outputFileNamePrefix
        File summaryFile
        String? outputPath = "./output"
        String? modules = "nanoplot/1.27.0"
        Int? memory = 16
    }
    parameter_meta {
        nanoplot: "NanoPlot module name to use."
        summaryFile: "Input summary file path produced by guppy"
        outputPath: "The output directory of the files in nanoplot"
        modules: "Environment module names and version to load (space separated) before command execution."
        memory: "Memory (in GB) allocated for job."
        outputFileNamePrefix: "Variable used to set the outputfile name"
    }
    meta {
        output_meta : {
            npOutput: "zipped output folder of nanoplot data"
        }
    }

    command <<<
        ~{nanoplot} --summary ~{summaryFile} -o ~{outputPath}
        zip -r ~{outputFileNamePrefix}_nanoreport.zip output
    >>>

    output {
        File npOutput = "~{outputFileNamePrefix}_nanoreport.zip"
    }
    runtime {
        modules: "~{modules}"
        memory: "~{memory} G"
    }
}