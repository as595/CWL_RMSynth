#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Create Output Data
baseCommand: python

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.Step1_outputs)
      - $(inputs.Step4_funcs)
      - $(inputs.Step2_params)
      
inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: /Users/annascaife/SRC/PYRMSYNTH/TEST/write_output.py
  Step1_outputs:
    type: File
  Step4_funcs:
    type: File
  Step2_params:
    type: File


outputs:
  Step5_funcs:
    type: File
    outputBinding:
      glob: "Step5_funcs"
  pfits:
    type: File
    outputBinding:
      glob: "*_p.fits"
  qfits:
    type: File
    outputBinding:
      glob: "*_q.fits"
  ufits:
    type: File
    outputBinding:
      glob: "*_u.fits"
  phifits:
    type: File
    outputBinding:
      glob: "*_phi.fits"
  polfits:
    type: File
    outputBinding:
      glob: "*_polint.fits"
  qmapfits:
    type: File
    outputBinding:
      glob: "*_qmap.fits"
  umapfits:
    type: File
    outputBinding:
      glob: "*_umap.fits"