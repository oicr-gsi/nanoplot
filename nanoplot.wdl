version 1.0

workflow nanoplot {
    input {
        String fastqFilePath
        String outputPath
    }
    call generateReports {
        input:
            fastqFilePath = fastqFilePath,
            outputPath = outputPath
    }
    output {
        File npOutput = generateReports.npOutput
    }
}

task generateReports {
    input {
        String? NanoPlot = "NanoPlot"
        String fastqFilePath
        String outputPath = "./output"
        String? modules = "nanoplot/1.27.0"
        Int? memory = 16
    }

    command <<<
        ~{NanoPlot} --fastq ~{fastqFilePath} -o ~{outputPath}
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