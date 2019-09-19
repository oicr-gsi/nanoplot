version 1.0

workflow nanoplot {
    input {
        String summaryFilePath
    }
    call generateReports {
        input:
            summaryFilePath = summaryFilePath,
    }
    output {
        File npOutput = generateReports.npOutput
    }
}

task generateReports {
    input {
        String? NanoPlot = "NanoPlot"
        String summaryFilePath
        String? outputPath = "./output"
        String? modules = "nanoplot/1.27.0"
        Int? memory = 16
    }

    command <<<
        ~{NanoPlot} --summary ~{summaryFilePath} -o ~{outputPath}
        zip -r npOutput.zip output
    >>>

    output {
        File npOutput = "./npOutput.zip"
    }
    runtime {
        modules: "~{modules}"
        memory: "~{memory} G"
    }
}