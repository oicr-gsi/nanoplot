version 1.0

workflow nanoplot {
    input {
        File summaryFile
    }
    parameter_meta {
        summaryFile: "Input summary file path produced by guppy"
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
    }
    output {
        File npOutput = generateReports.npOutput
    }
}

task generateReports {
    input {
        String? nanoplot = "NanoPlot"
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
    }
    meta {
        output_meta : {
            npOutput: "zipped output folder of nanoplot data"
        }
    }

    command <<<
        ~{nanoplot} --summary ~{summaryFile} -o ~{outputPath}
        zip -r npOutput.zip output
    >>>

    output {
        File npOutput = "npOutput.zip"
    }
    runtime {
        modules: "~{modules}"
        memory: "~{memory} G"
    }
}