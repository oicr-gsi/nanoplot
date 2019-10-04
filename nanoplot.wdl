version 1.0

workflow nanoplot {
    input {
        File summaryFile
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