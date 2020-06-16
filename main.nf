#!/usr/bin/env nextflow

// Adding in a second process.

nextflow.preview.dsl=2

process SayHello {
    input:
    val name

    output:
    file "out.txt"

    "echo Hello there, $name > out.txt"
}

process SortGreetings {
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