#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Create Output Data
baseCommand: python

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.Step1_outputs)
      - $(inputs.Step5_funcs)
      
inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: /Users/annascaife/SRC/PYRMSYNTH/TEST/clean_up.py
  Step1_outputs:
    type: File
  Step5_funcs:
    type: File

outputs: []