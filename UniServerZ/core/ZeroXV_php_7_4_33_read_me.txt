#############################################################################
                         Uniform Server Zero XV 
#############################################################################
 10-05-2024
#############################################################################

------------
Introduction
------------
 The Uniform Server Zero is designed for portability; emphasis is
 given to reducing code size. The Uniform Server Zero achieves this
 through a modular implementation. Install only modules (plugins)
 you require. These are listed in the documentation plugin section:
 ZeroXV_documentation_x_x_x.exe

------------------------
Install module (plugins)
------------------------

 All plugins are installed as follows:
  1) Copy a plugin to folder UniServerZ.
  2) Double-click on the downloaded plugin; this starts the extraction process.
  3) If requested, allow overwriting of existing files.

 Notes: Apache and PHP binaries are compiled with Visual Studio. 
 Ensure you have installed the latest supported Microsoft Visual C++ Redistributable packages for Visual Studio.
 Download: https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads (select: vc_redist.x64.exe)
 
 After installing a PHP module, always restart UniController.
 
----------------------
Additional Information
----------------------

-------------------------------------------------
Installing The Uniform Server Zero XV PHP plugin
-------------------------------------------------

The extraction procedure is identical for all plugins. Proceed as follows:

1) Download required PHP plugin installation file: ZeroXV_php_7_4_*.exe
2) Save to folder UniServerZ.
3) If running, stop Uniform Server.
4) Double-click on the above installation file. This runs the self extracting archive.
5) If prompted, allow overwriting of existing files.
6) If you wish, delete the installation file; it is no longer required.

-----------
PHP version
-----------
Select PHP version required as follows:

1) Ensure Apache is not running.
2) From UniController, open PHP drop-down menu.
3) Click Select version button.
4) Click button corresponding to the PHP plugin version required.
5) Start Apache and the new version of PHP will be recognised.

-------
Changes
-------

 php_7_4_32  	 - Initial Release of ZeroXV_php_7_4_32.exe
                 - Added php_mongodb.dll 1.13.0 
                 - Added php_xdebug.dll 3.1.5
 php_7_4_33		 - Updated php to php_7_4_33
                 - Updated php_mongodb.dll to 1.18.1 
                 - Updated php_xdebug.dll to 3.1.6
                 - Fixed the opcache / xdebug module (de)activation bug
	
 Updated php_development.ini to match php.ini-development
 Updated php_production.ini to match php.ini-production
 Updated php_test.ini to match php.ini-production
 Added php_cli.ini

--------------------------------------o0o------------------------------------
            Copyright 2002-2024 The Uniform Server Development Team
                            All rights reserved.


