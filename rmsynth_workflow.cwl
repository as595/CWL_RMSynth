#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
label: RMSynth Workflow

inputs:
  script1: File
  script2: File
  script3: File
  script4: File
  script5: File
  script6: File
  parfile: File
  FITSfiles: Directory
  flag: string

outputs:
  pfits:
    type: File
    outputSource: write_output/pfits
  qfits:
    type: File
    outputSource: write_output/qfits
  ufits:
    type: File
    outputSource: write_output/ufits
  phifits:
    type: File
    outputSource: write_output/phifits
  polfits:
    type: File
    outputSource: write_output/polfits
  qmapfits:
    type: File
    outputSource: write_output/qmapfits
  umapfits:
    type: File
    outputSource: write_output/umapfits
  rmsf:
    type: File
    outputSource: init_rmsynth/rmsf

steps:
  set_parameters:
    run: set_parameters.cwl

    in:
      script: script1
      RMparfile: parfile
      flag: flag

    out: [Step1_options, Step1_params, Step1_outputs]


  make_input_data:
    run: make_input_data.cwl

    in:
      Step1_options: set_parameters/Step1_options
      Step1_params: set_parameters/Step1_params
      Step1_outputs: set_parameters/Step1_outputs
      script: script2
      FITSfiles: FITSfiles
  
    out: [Step2_params,Step2_funcs]

  
  init_rmsynth:
    run: init_rmsynth.cwl

    in:
      script: script3
      Step2_params: make_input_data/Step2_params
      
    out: [Step3_rms,rmsf]


  make_output_data:
    run: make_output_data.cwl

    in:
      script: script4
      Step1_outputs: set_parameters/Step1_outputs
      Step2_funcs: make_input_data/Step2_funcs
      Step2_params: make_input_data/Step2_params
      Step3_rms: init_rmsynth/Step3_rms
      
    out: [Step4_funcs]


  write_output:
    run: write_output.cwl

    in:
      script: script5
      Step1_outputs: set_parameters/Step1_outputs
      Step4_funcs: make_output_data/Step4_funcs
      Step2_params: make_input_data/Step2_params
      
    out: [Step5_funcs,pfits,qfits,ufits,phifits,polfits,qmapfits,umapfits]


  clean_up:
    run: clean_up.cwl

    in:
      script: script6
      Step1_outputs: set_parameters/Step1_outputs
      Step5_funcs: write_output/Step5_funcs
      
    out: []

