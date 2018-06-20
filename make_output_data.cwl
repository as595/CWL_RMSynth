#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Create Output Data
baseCommand: python

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.Step1_outputs)
      - $(inputs.Step2_funcs)
      - $(inputs.Step2_params)
      - $(inputs.Step3_rms)
      
inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: /Users/annascaife/SRC/PYRMSYNTH/TEST/make_output_data.py
  Step1_outputs:
    type: File
  Step2_funcs:
    type: File
  Step2_params:
    type: File
  Step3_rms:
    type: File
  

outputs:
  Step4_funcs:
    type: File
    outputBinding:
      glob: "Step4_funcs"