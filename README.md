# BloatWare Manager for Asus Laptops
This is a batch (.bat) Windows Script for background services management for Asus Laptops.

Easy enable or disable bloatwares from asus laptops, mainly bloatware from laptops whcich uses armoury crate.

# Usage Examples

asusman [option]

  options:
    
      0 or off : soft turn off asus services   
      1 or on : soft turn on asus services
      
      2 or lightonly : Turn on lights management services
      
      enable : enable asus services but sets then to manual
      default : enable asus services with automatic initialization
      disable : disable asus services
      
      example : 
          asusman 0
          asusman 1
          asusman 2
          asusman lightonly
          asusman enable
          asusman default
          asusman disable
