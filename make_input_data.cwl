#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Format Input Data
baseCommand: python

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.FITSfiles)
      - $(inputs.Step1_options)
      - $(inputs.Step1_params)
      - $(inputs.Step1_outputs)
      
inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: /Users/annascaife/SRC/PYRMSYNTH/pyrmsynth/rmsynthesis.py
  FITSfiles:
    type: Directory
  Step1_options:
    type: File
  Step1_params:
    type: File
  Step1_outputs:
    type: File
  

outputs:
  Step2_params:
    type: File
    outputBinding:
      glob: "Step2_params"
  Step2_funcs:
    type: File
    outputBinding:
      glob: "Step2_funcs"