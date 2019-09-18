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
}

task generateReports {
    input {
        String? NanoPlot = "NanoPlot"
        String fastqFilePath
        String outputPath
        String? modules = "nanoplot/1.27.0"
    }

    command <<<
        ~{NanoPlot} --fastq ~{fastqFilePath} -o ~{outputPath}
    >>>

    output {
        String out = read_string(stdout())
    }
    runtime {
        modules: "~{modules}"
    }
}