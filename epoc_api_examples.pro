pro test_epoc_level_1
  compile_opt idl2
  
  fname = 'C:\Projects\EPOC\test data\A2008133154000.L1A_LAC'

  ;only required for georeferencing MODIS or SeaWiFS
  geo_fname = 'C:\Projects\EPOC\test data\A2008133154000.L2_LAC'

  output_path = 'C:\Projects\EPOC\test data\output\'
  
  ;NOTE
  ;-if you don't specify a projection, the default UTM zone for the 
  ; image is calculated
  ;-if you don't specify a two-element array of pixel sizes, the 
  ; defaults for the supplied product are used (e.g., 
  ; [1000.0d,1000.0d] for 1km data)
  ;-if you are georeferencing MODIS and you *don't* want to apply
  ; bowtie correction, set the /no_bowtie keyword
  ;-if you are running in full batch mode, set the /no_msg keyword to
  ; avoid seeing informational popup messages
  proj = envi_proj_create(/utm, zone=31, datum='WGS-84')
  ps = [1000.0d,1000.0d]
  no_bowtie = 0 ;same as not setting the keyword
  no_msg = 1 ;same as setting the keyword

  ;OUTPUT CHOICES
  ;0 -> standard product only
  ;1 -> georeferenced product only
  ;2 -> standard and georeferenced products
  output_choice = 2

  ;RETURNED VALUES
  ;r_fid -> ENVI FID for the standard product, if requested
  ;georef_fid -> ENVI FID for the georeferenced product, if requested
  convert_oc_data, fname=fname, output_path=output_path, $
    geo_fname=geo_fname, proj=proj, ps=ps, output_choice=output_choice, $
    r_fid=r_fid, georef_fid=georef_fid, no_bowtie=no_bowtie, $
    no_msg=no_msg   

  print, r_fid
  print, georef_fid
  
end


pro test_epoc_level_2
  compile_opt idl2
  
  fname = 'C:\Projects\EPOC\test data\A2008133154000.L2_LAC'

  output_path = 'C:\Projects\EPOC\test data\output\'
  
  ;NOTE
  ;-if you don't specify a projection, the default UTM zone for the 
  ; image is calculated
  ;-if you don't specify a two-element array of pixel sizes, the 
  ; defaults for the supplied product are used (e.g., 
  ; [1000.0d,1000.0d] for 1km data)
  ;-if you are georeferencing MODIS and you *don't* want to apply
  ; bowtie correction, set the /no_bowtie keyword
  ;-if you are running in full batch mode, set the /no_msg keyword to
  ; avoid seeing informational popup messages  
  proj = envi_proj_create(/utm, zone=31, datum='WGS-84')
  ps = [1000.0d,1000.0d]
  no_bowtie = 0 ;same as not setting the keyword
  no_msg = 1 ;same as setting the keyword

  ;OUTPUT CHOICES
  ;0 -> standard product only
  ;1 -> georeferenced product only
  ;2 -> standard and georeferenced products
  output_choice = 2

  ;RETURNED VALUES
  ;r_fid -> ENVI FID for the standard product, if requested
  ;georef_fid -> ENVI FID for the georeferenced product, if requested
  convert_oc_l2_data, fname=fname, output_path=output_path, $
    proj=proj, ps=ps, output_choice=output_choice, r_fid=r_fid, $
    georef_fid=georef_fid, no_bowtie=no_bowtie, no_msg=no_msg   

  print, r_fid
  print, georef_fid
  
end


pro test_epoc_level_3
  compile_opt idl2
  
  fname = 'C:\Projects\EPOC\test data\A2009199.L3m_DAY_CHLO_9'

  output_path = 'C:\Projects\EPOC\test data\output\'  
  
  ;RETURNED VALUES
  ;r_fid -> ENVI FID for the standard (already georeferenced) product
  convert_oc_l3_smi_data, fname=fname, output_path=output_path, r_fid=r_fid  
  
  print, r_fid
  
end