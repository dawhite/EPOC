pro test_epoc_level_1
  compile_opt idl2

  ;HDF Level 1A file
  fname = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\A2015276004000.L1A_LAC'
  ;netCDF Level 2 file
  geo_fname = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\A2015276004000.L2_LAC_SST4.nc'
  output_path = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\'
  
  output_choice = 2
  resamp = 1
  
  bridges = epoc_create_bridges()

  convert_oc_data, fname=fname, output_path=output_path, $
    output_choice=output_choice, r_fid=r_fid, /default_utm, $
    georef_fid=georef_fid, msg=msg, bridges=bridges, $
    resamp=resamp, geo_fname=geo_fname
      
  epoc_destroy_bridges, bridges
  
  ;if conversion failed, find out why
  if r_fid eq -1 or georef_fid eq -1 then print, msg

  print, r_fid
  print, georef_fid

end


pro test_epoc_level_2_with_datasets
  compile_opt idl2

  fname = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\A2015276004000.L2_LAC_SST4.nc'
  output_path = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\'

  ;optional specification of datasets to process
  datasets = ['sst4','flags_sst4']
  
  output_choice = 1
  resamp = 0
  
  bridges = epoc_create_bridges()

  convert_oc_l2_data, fname=fname, output_path=output_path, $
    output_choice=output_choice, r_fid=r_fid, /default_utm, $
    georef_fid=georef_fid, msg=msg, datasets=datasets, $
    bridges=bridges, resamp=resamp
      
  epoc_destroy_bridges, bridges
  
  ;if conversion failed, find out why
  if georef_fid eq -1 then print, msg

  print, r_fid
  print, georef_fid

end


pro test_epoc_level_3
  compile_opt idl2

  fname = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\A2015275.L3m_DAY_CHL_chl_ocx_4km.nc'

  output_path = 'C:\Users\Devin White\Desktop\Sandbox\EPOC\MODISA\'

  convert_oc_l3_smi_data, fname=fname, output_path=output_path, r_fid=r_fid, msg=msg

  ;if conversion failed, find out why
  if r_fid eq -1 then print, msg

  print, r_fid

end