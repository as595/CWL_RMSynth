#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Initialise RMSynthesis Class
baseCommand: python

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.Step2_params)
      
inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: /Users/annascaife/SRC/PYRMSYNTH/TEST/init_rmsynth.py
  Step2_params:
    type: File
  

outputs:
  Step3_rms:
    type: File
    outputBinding:
      glob: "Step3_rms"
  rmsf:
    type: File
    outputBinding:
      glob: "*_rmsf.txt"
