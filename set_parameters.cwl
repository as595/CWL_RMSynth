#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Set Parameters
baseCommand: python

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.RMparfile)

inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: /Users/annascaife/SRC/PYRMSYNTH/TEST/set_parameters.py
  flag:
    type: string
    inputBinding: {position: 2}
  RMparfile:
    type: File
    inputBinding: {position: 3}
  

outputs:
  Step1_options:
    type: File
    outputBinding:
      glob: "*_options"
  Step1_params:
    type: File
    outputBinding:
      glob: "*_params"
  Step1_outputs:
    type: File
    outputBinding:
      glob: "*_outputs"