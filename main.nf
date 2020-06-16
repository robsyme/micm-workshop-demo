#!/usr/bin/env nextflow

// Add publish directive

nextflow.preview.dsl=2

process SayHello {
    memory '4G'
    cpus 2

    input:
    val name

    output:
    file "out.txt"

    "echo Hello there, $name > out.txt"
}

process SortGreetings {
    publishDir "results/greetings"
    memory '2G'
    cpus 1

    input:
    path "unsorted_names.txt"

    output:
    path "names_sorted.txt"

    "sort unsorted_names.txt > names_sorted.txt"
}

workflow  {
    names = Channel.from(["Rob", "Rhalena", "Audrey", "Sophie", "Michael", "Juan", "Yujing", "Nahid"])

    names | SayHello | collectFile | SortGreetings | view
}