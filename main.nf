#!/usr/bin/env nextflow

// Run a process for each name.
// At the end, add a call to view so that we can print the names of

nextflow.preview.dsl=2

process SayHello {
    input:
    val name

    output:
    file 'out.txt'

    "echo Hello $name > out.txt"
}

workflow  {
    names = Channel.from(["Rob", "Rhalena", "Audrey", "Sophie", "Michael", "Juan", "Yujing", "Nahid"])

    names | SayHello
}