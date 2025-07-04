set(MUSA_MCC_FLAGS                                                                                               
--offload-arch=mp_10                                                                                         
--offload-arch=mp_21                                                                                         
--offload-arch=mp_22                                                                                         
--offload-arch=mp_31                                                                                         
-Werror) 

set(MUSA_LINK_LIBRARIES_KEYWORD PRIVATE)
musa_add_executable(musa_test musa_test.mu)
